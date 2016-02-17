Shader "TMX/Terrain/Mip Biased" {
	Properties {
		_GrassLow ("Low Grass", 2D) = "white" {}
		_GrassLowNormal ("Low Grass Normal", 2D) = "bump" {}
		_GrassHigh ("High Grass", 2D) = "white" {}
		_GrassHighNormal ("High Grass Normal", 2D) = "bump" {}
		_Cliff ("Cliff", 2D) = "white" {}
		_CliffNormal ("Cliff Normal", 2D) = "bump" {}

		_Strata ("Cliff Strata", 2D) = "white" {}
		_DiffuseNoise ("Diffuse Noise", 2D) = "white" {}
		_DiffuseNoiseScale ("Diffuse Noise Scale", Range(0,60)) = 20
		
		_BurntTexture ("Burnt Texture", 2D) = "black" {}
		_Scorched ("Scorched", 2D) = "white" {}
		_ScorchedNormal ("Scorched Normal", 2D) = "white" {}
		_ScorchedScale ("Scorched Scale", Range(0, 40)) = 10

		_SlopePatchinessNoise ("Slope Patchiness Noise", 2D) = "white" {}

		_NormalMipBias ("Normal Mip Bias (Negative Values Are Sharper)", Range(-5,0)) = -1

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
		sampler2D _GrassLowNormal;
		sampler2D _GrassHigh;
		sampler2D _GrassHighNormal;
		sampler2D _Cliff;
		sampler2D _CliffNormal;

		sampler2D _Strata;
		sampler2D _DiffuseNoise;

		sampler2D _BurntTexture;
		sampler2D _Scorched;
		sampler2D _ScorchedNormal;

		half4 _MapSize;
		half4 _BlendingSettings;

		half _Scale;
		half _DiffuseNoiseScale;
		half _ScorchedScale;

		half _StrataVScale;
		half _StrataHScale;

		half _NormalMipBias;

		sampler2D _SlopePatchinessNoise;
		
		struct Input
		{
			float2 uv_BurntTexture;
			float2 uv_SlopePatchinessNoise;
			float3 worldPos;
			float3 uneditedNormal;
			float3 worldNormal; INTERNAL_DATA
		};

		struct TPMOutput
		{
			float4 albedo;
			float4 normal;
		};

		half _Metallic;
		fixed4 _Color;

		TPMOutput TPM(float3 localNormal, float3 localPosition, float slopePercent, float heightPercent, float burntAmount)
		{
			TPMOutput tpmOutput;

            localNormal *= localNormal * localNormal * localNormal;
            localNormal = localNormal.rgb / (localNormal.r + localNormal.g + localNormal.b);

            float4 Strata = tex2D(_Strata, float2((localPosition.x + localPosition.z) * .05 * _StrataHScale, localPosition.y * .05 * _StrataVScale));
            float3 scorchedPosition = localPosition/_ScorchedScale;
            float3 noisePosition = localPosition/_DiffuseNoiseScale;


            //------------------------------------------------- LOW GRASS SECTION -------------------------------------------------
            localPosition = localPosition/_Scale;
            float4 tex1 = tex2D(_GrassLow, localPosition.rg);
            float4 tex2 = tex2D(_GrassLow, localPosition.rb);
            float4 tex3 = tex2D(_GrassLow, localPosition.gb);
            tpmOutput.albedo = (localNormal.b*tex1 + localNormal.g*tex2 + localNormal.r*tex3) * (1 - heightPercent) * (1 - slopePercent);

            tex1 = tex2Dbias(_GrassLowNormal, float4(localPosition.rg, 0, _NormalMipBias));
            tex2 = tex2Dbias(_GrassLowNormal, float4(localPosition.rb, 0, _NormalMipBias));
            tex2 = float4(tex2.g, tex2.b, tex2.r,tex2.a);
            tex3 = tex2Dbias(_GrassLowNormal, float4(localPosition.gb, 0, _NormalMipBias));
            tex3 = float4(tex3.b, tex3.r, tex3.g,tex3.a);
            tpmOutput.normal = (tex1 * localNormal.b + tex2 * localNormal.g + tex3 * localNormal.r) * (1 - heightPercent) * (1 - slopePercent);



            //------------------------------------------------- HIGH GRASS SECTION -------------------------------------------------
            tex1 = tex2D(_GrassHigh, localPosition.rg);
            tex2 = tex2D(_GrassHigh, localPosition.rb);
            tex3 = tex2D(_GrassHigh, localPosition.gb);
            tpmOutput.albedo += (localNormal.b*tex1 + localNormal.g*tex2 + localNormal.r*tex3) * heightPercent * (1 - slopePercent);

            tex1 = tex2Dbias(_GrassHighNormal, float4(localPosition.rg, 0, _NormalMipBias));
            tex2 = tex2Dbias(_GrassHighNormal, float4(localPosition.rb, 0, _NormalMipBias));
            tex2 = float4(tex2.g, tex2.b, tex2.r,tex2.a);
            tex3 = tex2Dbias(_GrassHighNormal, float4(localPosition.gb, 0, _NormalMipBias));
            tex3 = float4(tex3.b, tex3.r, tex3.g,tex3.a);
            tpmOutput.normal += (tex1 * localNormal.b + tex2 * localNormal.g + tex3 * localNormal.r) * heightPercent * (1 - slopePercent);


            //------------------------------------------------- CLIFF SECTION -------------------------------------------------
            tex1 = tex2D(_Cliff, localPosition.rg);
            tex2 = tex2D(_Cliff, localPosition.rb);
            tex3 = tex2D(_Cliff, localPosition.gb);
           tpmOutput.albedo += (localNormal.b*tex1 + localNormal.g*tex2 + localNormal.r*tex3) * Strata * slopePercent;

            tex1 = tex2Dbias(_CliffNormal, float4(localPosition.rg, 0, _NormalMipBias));
            tex2 = tex2Dbias(_CliffNormal, float4(localPosition.rb, 0, _NormalMipBias));
            tex2 = float4(tex2.g, tex2.b, tex2.r,tex2.a);
            tex3 = tex2Dbias(_CliffNormal, float4(localPosition.gb, 0, _NormalMipBias));
            tex3 = float4(tex3.b, tex3.r, tex3.g,tex3.a);
            tpmOutput.normal += (tex1 * localNormal.b + tex2 * localNormal.g + tex3 * localNormal.r) * slopePercent;

            //------------------------------------------------- DIFFUSE NOISE SECTION -------------------------------------------------
            float noiseTex1 = tex2D(_DiffuseNoise, noisePosition.rg).r;
            float noiseTex2 = tex2D(_DiffuseNoise, noisePosition.rb).r;
            float noiseTex3 = tex2D(_DiffuseNoise, noisePosition.gb).r;
           	tpmOutput.albedo *= (localNormal.b*noiseTex1 + localNormal.g*noiseTex2 + localNormal.r*noiseTex3) * (1 - burntAmount);



            //------------------------------------------------- SCORCHED SECTION -------------------------------------------------
            float3 scorchTex1 = tex2D(_Scorched, scorchedPosition.rg);
            float3 scorchTex2 = tex2D(_Scorched, scorchedPosition.rb);
            float3 scorchTex3 = tex2D(_Scorched, scorchedPosition.bg);
            tpmOutput.albedo += float4((localNormal.b*scorchTex1 + localNormal.g*scorchTex2 + localNormal.r*scorchTex3), .05) * burntAmount;

            tex1 = tex2Dbias(_ScorchedNormal, float4(scorchedPosition.rg, 0, _NormalMipBias));
            tex2 = tex2Dbias(_ScorchedNormal, float4(scorchedPosition.rb, 0, _NormalMipBias));
            tex2 = float4(tex2.g, tex2.b, tex2.r,tex2.a);
            tex3 = tex2Dbias(_ScorchedNormal, float4(scorchedPosition.gb, 0, _NormalMipBias));
            tex3 = float4(tex3.b, tex3.r, tex3.g,tex3.a);
            tpmOutput.normal *= (1 - burntAmount);
            tpmOutput.normal += (tex1 * localNormal.b + tex2 * localNormal.g + tex3 * localNormal.r) * burntAmount;

            return tpmOutput;
        }

        void vert (inout appdata_full v, out Input OUT)
		{
			UNITY_INITIALIZE_OUTPUT(Input, OUT);
			OUT.uneditedNormal = v.normal;
		}

		void surf (Input IN, inout SurfaceOutputStandard o)
		{			
			float3 patchiness = tex2D(_SlopePatchinessNoise, IN.uv_SlopePatchinessNoise);
			float slope = acos(dot(IN.uneditedNormal, float3(0,1,0))) * 57.2958;
			float slopePercent = (clamp(slope, _BlendingSettings.z, _BlendingSettings.w) - _BlendingSettings.z) / (_BlendingSettings.w - _BlendingSettings.z) * patchiness.r;
			slopePercent = 1 - (1 - slopePercent) * (1 - slopePercent);
			slopePercent = slopePercent * slopePercent * (3.0 - 2.0 * slopePercent);

			float heightPercent = IN.worldPos.y / _MapSize.y * patchiness.g;
			heightPercent = (clamp(heightPercent, _BlendingSettings.x, _BlendingSettings.y) - _BlendingSettings.x) / (_BlendingSettings.y - _BlendingSettings.x);

			heightPercent *= heightPercent * (3 - 2 * heightPercent);

			float burntAmount = tex2Dbias(_BurntTexture, float4(IN.uv_BurntTexture, 0, .5)).r;

			TPMOutput tpmData = TPM(IN.uneditedNormal, IN.worldPos, slopePercent, heightPercent, burntAmount);

			o.Albedo = tpmData.albedo.rgb;
			o.Normal = UnpackNormal(tpmData.normal);

			o.Metallic = _Metallic;
			o.Smoothness = tpmData.albedo.a;
			o.Alpha = 1;
		}
		ENDCG
	}
	FallBack "Diffuse"
}