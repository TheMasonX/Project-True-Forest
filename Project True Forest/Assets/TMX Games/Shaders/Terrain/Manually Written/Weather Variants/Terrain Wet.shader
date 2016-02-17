Shader "TMX/Terrain/Variants/Terrain Wet" {
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

		_Scale ("TPM Scale", Range(0,25)) = 10
		_StrataVScale ("Strata Vertical Scale", Range(0,1)) = 1
		_StrataHScale ("Strata Horizontal Scale", Range(0,1)) = 1

		_MapSize ("Map Size", Vector) = (600,200,600,0)
		_BlendingSettings ("Blending Options (Low/High height percents, cliff start/end slope angles)", Vector) = (.35,.9,32.5,55)

		_WaterFlowMap ("Water Flow Map", 2D) = "gray" {}
		_WaterDiffuse ("Water Diffuse", 2D) = "blue" {}
		_WaterNormal ("Water Normal", 2D) = "white" {}
		_WaterMetallic ("Water Metallic", Range(0,1)) = 0.5
		_WaterSmoothness ("Water Smoothness", Range(0,1)) = 0.8
		_WaterAnimationSpeed ("Water Animation Speed", Range(0,5)) = .1
		_WaterAmount ("Water Amount", Range(0,1)) = 0
		_WaterBlending ("Water Blending Options (XY - min/max slope to puddle in)", Vector) = (0.0,60.0,0.0,0.0)
		_RivuletPhases ("Rivulet Phases", Vector) = (1.3589,3.1415926,1.7623,.94234)
		_RivuletAmount ("Rivulet Multiplier", Range(0,1)) = .1

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

		float4 _MapSize;
		float4 _BlendingSettings;

		float _Scale;
		float _DiffuseNoiseScale;
		float _ScorchedScale;

		float _StrataVScale;
		float _StrataHScale;

		sampler2D _WaterFlowMap;
		sampler2D _WaterDiffuse;
		sampler2D _WaterNormal;
		float _WaterMetallic;
		float _WaterSmoothness;
		float _WaterAmount;
		float _WaterAnimationSpeed;
		float4 _WaterBlending;
		float4 _RivuletPhases;
		float _RivuletAmount;
		
		struct Input
		{
			float2 uv_BurntTexture;
			float2 uv_WaterFlowMap;
			float2 uv_WaterDiffuse;
			float3 worldPos;
			float3 uneditedNormal;
			float3 worldNormal; INTERNAL_DATA
		};

		struct TPMOutput
		{
			float4 albedo;
			float4 normal;
		};

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
            float4 tex1 = tex2D(_GrassLow,localPosition.rg);
            float4 tex2 = tex2D(_GrassLow,localPosition.rb);
            float4 tex3 = tex2D(_GrassLow,localPosition.gb);
            tpmOutput.albedo = (localNormal.b*tex1 + localNormal.g*tex2 + localNormal.r*tex3) * (1 - heightPercent) * (1 - slopePercent);

            tex1 = tex2D(_GrassLowNormal,localPosition.rg);
            tex2 = tex2D(_GrassLowNormal,localPosition.rb);
            tex2 = float4(tex2.g, tex2.b, tex2.r,tex2.a);
            tex3 = tex2D(_GrassLowNormal,localPosition.gb);
            tex3 = float4(tex3.b, tex3.r, tex3.g,tex3.a);
            tpmOutput.normal = (tex1 * localNormal.b + tex2 * localNormal.g + tex3 * localNormal.r) * (1 - heightPercent) * (1 - slopePercent);



            //------------------------------------------------- HIGH GRASS SECTION -------------------------------------------------
            tex1 = tex2D(_GrassHigh,localPosition.rg);
            tex2 = tex2D(_GrassHigh,localPosition.rb);
            tex3 = tex2D(_GrassHigh,localPosition.gb);
            tpmOutput.albedo += (localNormal.b*tex1 + localNormal.g*tex2 + localNormal.r*tex3) * heightPercent * (1 - slopePercent);

            tex1 = tex2D(_GrassHighNormal,localPosition.rg);
            tex2 = tex2D(_GrassHighNormal,localPosition.rb);
            tex2 = float4(tex2.g, tex2.b, tex2.r,tex2.a);
            tex3 = tex2D(_GrassHighNormal,localPosition.gb);
            tex3 = float4(tex3.b, tex3.r, tex3.g,tex3.a);
            tpmOutput.normal += (tex1 * localNormal.b + tex2 * localNormal.g + tex3 * localNormal.r) * heightPercent * (1 - slopePercent);


            //------------------------------------------------- CLIFF SECTION -------------------------------------------------
            tex1 = tex2D(_Cliff,localPosition.rg);
            tex2 = tex2D(_Cliff,localPosition.rb);
            tex3 = tex2D(_Cliff,localPosition.gb);
           tpmOutput.albedo += (localNormal.b*tex1 + localNormal.g*tex2 + localNormal.r*tex3) * Strata * slopePercent;

            tex1 = tex2D(_CliffNormal,localPosition.rg);
            tex2 = tex2D(_CliffNormal,localPosition.rb);
            tex2 = float4(tex2.g, tex2.b, tex2.r,tex2.a);
            tex3 = tex2D(_CliffNormal,localPosition.gb);
            tex3 = float4(tex3.b, tex3.r, tex3.g,tex3.a);
            tpmOutput.normal += (tex1 * localNormal.b + tex2 * localNormal.g + tex3 * localNormal.r) * slopePercent;

            //------------------------------------------------- DIFFUSE NOISE SECTION -------------------------------------------------
            float noiseTex1 = tex2D(_DiffuseNoise,noisePosition.rg).r;
            float noiseTex2 = tex2D(_DiffuseNoise,noisePosition.rb).r;
            float noiseTex3 = tex2D(_DiffuseNoise,noisePosition.gb).r;
           	tpmOutput.albedo *= (localNormal.b*noiseTex1 + localNormal.g*noiseTex2 + localNormal.r*noiseTex3) * (1 - burntAmount);



            //------------------------------------------------- SCORCHED SECTION -------------------------------------------------
            float3 scorchTex1 = tex2D(_Scorched, scorchedPosition.rg);
            float3 scorchTex2 = tex2D(_Scorched, scorchedPosition.rb);
            float3 scorchTex3 = tex2D(_Scorched, scorchedPosition.bg);
            tpmOutput.albedo += float4((localNormal.b*scorchTex1 + localNormal.g*scorchTex2 + localNormal.r*scorchTex3), .05) * burntAmount;

            tex1 = tex2D(_ScorchedNormal,scorchedPosition.rg);
            tex2 = tex2D(_ScorchedNormal,scorchedPosition.rb);
            tex2 = float4(tex2.g, tex2.b, tex2.r,tex2.a);
            tex3 = tex2D(_ScorchedNormal,scorchedPosition.gb);
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

		float RemapToPercent (float value, float minOutput, float maxOutput)
		{
			return (clamp(value, minOutput, maxOutput) - minOutput) / (maxOutput - minOutput);
		}

		float Hermite (float value)
		{
			return value * value * (3.0 - 2.0 * value);
		}

		void surf (Input IN, inout SurfaceOutputStandard o)
		{			
			float slope = acos(dot(IN.uneditedNormal, float3(0,1,0))) * 57.2958;
			float slopePercent = RemapToPercent(slope, _BlendingSettings.z, _BlendingSettings.w);
			slopePercent = 1 - (1 - slopePercent) * (1 - slopePercent);
			slopePercent = Hermite(slopePercent);

			float heightPercent = IN.worldPos.y / _MapSize.y;
			heightPercent = RemapToPercent(heightPercent, _BlendingSettings.x, _BlendingSettings.y);
			heightPercent = Hermite(heightPercent);

			float burntAmount = tex2D(_BurntTexture, IN.uv_BurntTexture).r;

			TPMOutput tpmData = TPM(IN.uneditedNormal, IN.worldPos, slopePercent, heightPercent, burntAmount);

			float4 prewaterNormal = tpmData.normal;

			float animationAmount = _Time.x * _WaterAnimationSpeed;
			float anim1 = frac(animationAmount);
			float anim2 = frac(animationAmount + .5);

			float lerpValue = abs((.5 - anim1) * 2);
			lerpValue *= lerpValue * (3.0 - 2.0 * lerpValue);

			float2 waterUV1 = IN.uv_WaterDiffuse;
			float2 waterUV2 = IN.uv_WaterDiffuse * 1.11235813213455 + .6231993;

//			float uvCos = cos(3.1415926 / 3.0);
//          	float uvSin = sin(3.1415926 / 3.0);
//			float2 waterUV2 = (mul(IN.uv_WaterDiffuse-float2(0.5,0.5),float2x2( uvCos, -uvSin, uvSin, uvCos))+float2(0.5,0.5));

			float4 flowMap = tex2D(_WaterFlowMap, IN.uv_WaterFlowMap);
			float2 flow = (flowMap.rg - .5) * -4.0;

//			float x1 = (sin(IN.worldPos.x * .523451 + _Time.x * _RivuletPhases.x) + .856443) * .48753;
//			float y1 = (cos(IN.worldPos.y * .345134 - _Time.x * _RivuletPhases.y) + .721451) * .560234;
//			float z1 = (sin(IN.worldPos.z * .412345 - _Time.x * _RivuletPhases.z) + .634833) * .4502349;
//			float w1 = (cos((IN.worldPos.z - IN.worldPos.y) * .25234 + _Time.x * _RivuletPhases.w) + .934512) * .67589;

			float x1 = (sin(IN.worldPos.x * 1.523451 * _RivuletPhases.x) + .856443) * .48753;
			float y1 = (cos(IN.worldPos.y * 1.345134 * _RivuletPhases.y) + .721451) * .560234;
			float z1 = (sin(IN.worldPos.z * 1.412345 * _RivuletPhases.z) + .634833) * .4502349;
			float w1 = (cos((IN.worldPos.z - IN.worldPos.y) * 1.25234 * _RivuletPhases.w) + .934512) * .67589;

			flow.x *= 1 + ((x1 + w1) * _RivuletAmount * .9348234);
			flow.y *= 1 + ((y1 + z1) * _RivuletAmount);

			waterUV1 += flow * anim1;
			waterUV2 += flow * anim2;

			float4 waterTexture = lerp(tex2D(_WaterDiffuse, waterUV1), tex2D(_WaterDiffuse, waterUV2), lerpValue);
			float4 waterNormals = lerp(tex2D(_WaterNormal, waterUV1), tex2D(_WaterNormal, waterUV2), lerpValue);
			
			float waterSlope = dot(float3(0,1,0), IN.uneditedNormal);


			float broadSlopePercent = RemapToPercent(slope, .001 + _WaterBlending.y * _WaterAmount, .01 + _WaterBlending.z * _WaterAmount);
			broadSlopePercent *= broadSlopePercent * broadSlopePercent;
			float slopeAmount = 1 - saturate(waterSlope / (.3 + _WaterAmount / .7));
//			calcWaterAmount *= waterTexture.a;

			float lessenedAlpha = (1 - (1 - waterTexture.a) * (1 - waterTexture.a));
			
//			o.Albedo = tpmData.albedo.rgb;
//			o.Albedo = lerp(tpmData.albedo.rgb, waterTexture.rgb, calcWaterAmount * waterTexture.a);
			o.Albedo = tpmData.albedo.rgb * lerp(float3(1,1,1), waterTexture.rgb, saturate(slopeAmount + _WaterAmount * .2) * waterTexture.a);
//			o.Normal = UnpackNormal(lerp(prewaterNormal, waterNormals, slopeAmount));
			o.Normal = UnpackNormal(lerp(prewaterNormal, waterNormals, slopeAmount *  lessenedAlpha));
			o.Metallic = lerp(0.0, _WaterMetallic, slopeAmount * lessenedAlpha);
			o.Smoothness = lerp(tpmData.albedo.a, _WaterSmoothness, slopeAmount * lessenedAlpha);

//			o.Emission = ;
//			o.Smoothness = 0;
//			o.Metallic = 0;
//			o.Albedo = 0;


			o.Alpha = 1;
		}
		ENDCG
	}
	FallBack "Diffuse"
}