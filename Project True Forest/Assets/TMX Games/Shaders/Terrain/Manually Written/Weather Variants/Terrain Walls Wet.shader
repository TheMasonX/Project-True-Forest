Shader "TMX/Terrain/Walls" {
	Properties {
		_SideDiffuse ("Side", 2D) = "white" {}
		_SideNormal ("Side Normal", 2D) = "bump" {}

		_Strata ("Side Strata", 2D) = "white" {}
		_StrataVScale ("Strata Vertical Scale", Range(0,1)) = 1
		_StrataHScale ("Strata Horizontal Scale", Range(0,1)) = 1


//		_DiffuseNoise ("Diffuse Noise", 2D) = "white" {}
//		_DiffuseNoiseScale ("Diffuse Noise Scale", Range(0,30)) = 10

		

		_Smoothness ("Smoothness", Range(0,1)) = 0.0
		_Metallic ("Metallic", Range(0,1)) = 0.0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _SideDiffuse;
		sampler2D _SideNormal;
		sampler2D _Strata;
//		sampler2D _DiffuseNoise;
//		float _DiffuseNoiseScale;

		float _StrataHScale;
		float _StrataVScale;
		
		struct Input
		{
			float2 uv_SideDiffuse;
			float2 uv_Strata;
			float3 worldPos;
			float3 worldNormal; INTERNAL_DATA
		};

		half _Metallic;
		half _Smoothness;
		fixed4 _Color;

		void surf (Input IN, inout SurfaceOutputStandard o)
		{
			float4 strata = tex2D(_Strata, float2((IN.worldPos.x + IN.worldPos.z) * .05 * _StrataHScale, IN.worldPos.y * .05 * _StrataVScale));
			float4 diffuse = tex2D(_SideDiffuse, IN.uv_SideDiffuse) * strata;
			o.Albedo = diffuse.rgb;
			float4 norm = tex2D(_SideNormal, IN.uv_SideDiffuse);
			o.Normal = UnpackNormal(norm);

			o.Metallic = _Metallic;
			o.Smoothness = diffuse.a * _Smoothness;
			o.Alpha = 1;
		}
		ENDCG
	}
	FallBack "Diffuse"
}