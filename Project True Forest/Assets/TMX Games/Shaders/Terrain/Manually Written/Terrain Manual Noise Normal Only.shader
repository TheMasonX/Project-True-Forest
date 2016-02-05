Shader "TMX/Terrain/Normal Noise Only" {
	Properties {
		_GrassLow ("Low Grass", 2D) = "white" {}
		_GrassHigh ("High Grass", 2D) = "white" {}
		_Cliff ("Cliff", 2D) = "white" {}
		_Strata ("Cliff Strata", 2D) = "white" {}
		_DiffuseNoise ("Diffuse Noise", 2D) = "white" {}
		_DiffuseNoiseScale ("Diffuse Noise Scale", Range(0,30)) = 10
		
		_NormalNoise ("Normal Noise", 2D) = "bump" {}
		_NormalNoiseScale ("Normal Noise Scale", Range(0,30)) = 10
		
		_BurntTexture ("Burnt Texture", 2D) = "black" {}
		_Scorched ("Scorched", 2D) = "white" {}
		_ScorchedScale ("Scorched Scale", Range(0, 40)) = 10
		

		_Scale ("TPM Scale", Range(0,25)) = 10
		_StrataVScale ("Strata Vertical Scale", Range(0,1)) = 1
		_StrataHScale ("Strata Horizontal Scale", Range(0,1)) = 1

		_MapSize ("Map Size", Vector) = (600,200,600,0)
		_BlendingSettings ("Blending Options (Low/High height percents, cliff start/end slope angles)", Vector) = (.35,.9,32.5,55)

		_Metallic ("Metallic", Range(0,1)) = 0.0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard vertex:vert fullforwardshadows

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _GrassLow;
		sampler2D _GrassHigh;
		sampler2D _Cliff;
		sampler2D _Strata;
		sampler2D _DiffuseNoise;
		sampler2D _NormalNoise;

		sampler2D _BurntTexture;
		sampler2D _Scorched;

		float4 _MapSize;
		float4 _BlendingSettings;

		float _Scale;
		float _StrataVScale;
		float _StrataHScale;
		float _DiffuseNoiseScale;
		float _NormalNoiseScale;
		float _ScorchedScale;
		
		struct Input
		{
			float2 uv_NormalNoise;
			float2 uv_BurntTexture;
			float3 worldPos;
			float3 uneditedNormal;
			float3 worldNormal; INTERNAL_DATA
		};

		half _Metallic;
		fixed4 _Color;

		float4 TPM( float3 localNormal, float3 localPosition, float slopePercent, float heightPercent, float burntAmount)
		{
			
            localNormal *= localNormal * localNormal * localNormal;
            localNormal = localNormal.rgb / (localNormal.r + localNormal.g + localNormal.b);

            float4 Strata = tex2D(_Strata, float2((localPosition.x + localPosition.z) * .05 * _StrataHScale, localPosition.y * .05 * _StrataVScale));

            float3 scorchedPosition = localPosition/_ScorchedScale;

            localPosition = localPosition/_Scale;
            float4 tex1 = tex2D(_GrassLow,localPosition.rg);
            float4 tex2 = tex2D(_GrassLow,localPosition.rb);
            float4 tex3 = tex2D(_GrassLow,localPosition.gb);
            float4 lowGrassResult = (localNormal.b*tex1 + localNormal.g*tex2 + localNormal.r*tex3) * (1 - heightPercent) * (1 - slopePercent);
            
            
            tex1 = tex2D(_Cliff,localPosition.rg);
            tex2 = tex2D(_Cliff,localPosition.rb);
            tex3 = tex2D(_Cliff,localPosition.gb);
            float4 cliffResult = (localNormal.b*tex1 + localNormal.g*tex2 + localNormal.r*tex3) * Strata * slopePercent;
            
            tex1 = tex2D(_GrassHigh,localPosition.rg);
            tex2 = tex2D(_GrassHigh,localPosition.rb);
            tex3 = tex2D(_GrassHigh,localPosition.gb);
            float4 highGrassResult = (localNormal.b*tex1 + localNormal.g*tex2 + localNormal.r*tex3) * heightPercent * (1 - slopePercent);

            float3 scorchTex1 = tex2D(_Scorched, scorchedPosition.rg);
            float3 scorchTex2 = tex2D(_Scorched, scorchedPosition.rb);
            float3 scorchTex3 = tex2D(_Scorched, scorchedPosition.bg);
            float3 scorchTexResult = (localNormal.b*scorchTex1 + localNormal.g*scorchTex2 + localNormal.r*scorchTex3);

            localPosition = localPosition * _Scale / _DiffuseNoiseScale;
            float noiseTex1 = tex2D(_DiffuseNoise,localPosition.rg).r;
            float noiseTex2 = tex2D(_DiffuseNoise,localPosition.rb).r;
            float noiseTex3 = tex2D(_DiffuseNoise,localPosition.gb).r;
            float4 noiseResult = (localNormal.b*noiseTex1 + localNormal.g*noiseTex2 + localNormal.r*noiseTex3);

            
            return ((1 - burntAmount) * (lowGrassResult + cliffResult + highGrassResult) * noiseResult + (burntAmount * float4(scorchTexResult, 0.05)));
        }

        float4 NormalTPM( float3 localNormal, float3 localPosition)
		{
			localNormal *= localNormal * localNormal * localNormal;
            localNormal = localNormal.rgb / (localNormal.r + localNormal.g + localNormal.b);

            localPosition = localPosition/_NormalNoiseScale;
            float4 tex1 = tex2D(_NormalNoise,localPosition.rg);
            float4 tex2 = tex2D(_NormalNoise,localPosition.rb);
            tex2 = float4(tex2.g, tex2.b, tex2.r,tex2.a);
            float4 tex3 = tex2D(_NormalNoise,localPosition.gb);
            tex3 = float4(tex3.b, tex3.r, tex3.g,tex3.a);
            float4 normalResult = (tex1 * localNormal.b + tex2 * localNormal.g + tex3 * localNormal.r);
            
            return normalResult;
        }

        void vert (inout appdata_full v, out Input OUT)
		{
			UNITY_INITIALIZE_OUTPUT(Input, OUT);
			OUT.uneditedNormal = v.normal;
		}

		void surf (Input IN, inout SurfaceOutputStandard o)
		{
			float4 normal = NormalTPM(IN.uneditedNormal, IN.worldPos);
			o.Normal = UnpackNormal(normal);

			float3 editedNormal = WorldNormalVector(IN, o.Normal);

			float burntAmount = tex2D(_BurntTexture, IN.uv_BurntTexture).r;

			float slope = acos(dot(editedNormal, float3(0,1,0))) * 57.2958;
			float slopePercent = (clamp(slope, _BlendingSettings.z, _BlendingSettings.w) - _BlendingSettings.z) / (_BlendingSettings.w - _BlendingSettings.z);
			slopePercent = 1 - (1 - slopePercent) * (1 - slopePercent);

			float heightPercent = IN.worldPos.y / _MapSize.y;
			heightPercent = (clamp(heightPercent, _BlendingSettings.x, _BlendingSettings.y) - _BlendingSettings.x) / (_BlendingSettings.y - _BlendingSettings.x);

			fixed4 c = TPM(editedNormal, IN.worldPos, slopePercent, heightPercent, burntAmount);
			o.Albedo = c.rgb;

			o.Metallic = _Metallic;
			o.Smoothness = c.a;
			o.Alpha = 1;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
