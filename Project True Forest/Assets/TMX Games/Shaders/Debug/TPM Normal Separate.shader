Shader "TMX/TPM Norm/Separate Functions" {
	Properties {
		_MainTex ("Diffuse", 2D) = "white" {}
		_Normal ("Normal", 2D) = "bump" {}
		_Scale ("Scale", Range(0,10)) = 4

		_Metallic ("Metallic", Range(0,1)) = 0.0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		//!!!!!!!!!!!!!!!!!!! IMPORTANT
		#pragma surface surf Standard vertex:NORM_TPM fullforwardshadows
		#pragma target 3.0

		sampler2D _MainTex;
		sampler2D _Normal;

		float _Scale;
		
		struct Input
		{
			float3 worldPos;
			float3 uneditedNormal;
			float3 worldNormal; INTERNAL_DATA
		};

		void NORM_TPM (inout appdata_full v, out Input OUT)
		{
			UNITY_INITIALIZE_OUTPUT(Input, OUT);
			OUT.uneditedNormal = v.normal;
		}

		half _Metallic;
		fixed4 _Color;

		float4 TPM( float3 localNormal, float3 localPosition)
		{
			localNormal *= localNormal * localNormal * localNormal;
            localNormal = localNormal.rgb / (localNormal.r + localNormal.g + localNormal.b);

            localPosition = localPosition/_Scale;
            float4 tex1 = tex2D(_MainTex,localPosition.rg);
            float4 tex2 = tex2D(_MainTex,localPosition.rb);
            float4 tex3 = tex2D(_MainTex,localPosition.gb);
            float4 diffuseResult = (tex1 * localNormal.b + tex2 * localNormal.g + tex3 * localNormal.r);
            
            return diffuseResult;
        }

		float4 NormalTPM( float3 localNormal, float3 localPosition)
		{
			localNormal *= localNormal * localNormal * localNormal;
            localNormal = localNormal.rgb / (localNormal.r + localNormal.g + localNormal.b);

            localPosition = localPosition/_Scale;
            float4 tex1 = tex2D(_Normal,localPosition.rg);
            float4 tex2 = tex2D(_Normal,localPosition.rb);
            tex2 = float4(tex2.g, tex2.b, tex2.r, tex2.a);
            float4 tex3 = tex2D(_Normal,localPosition.gb);
            tex3 = float4(tex3.b, tex3.r, tex3.g, tex3.a);
            float4 normalResult = (tex1 * localNormal.b + tex2 * localNormal.g + tex3 * localNormal.r);
            
            return normalResult;
        }

		void surf (Input IN, inout SurfaceOutputStandard o)
		{
			o.Albedo = TPM(IN.uneditedNormal, IN.worldPos);
			o.Normal = UnpackNormal(NormalTPM(IN.uneditedNormal, IN.worldPos));

			o.Metallic = _Metallic;
			o.Smoothness = .2;
			o.Alpha = 1;
		}
		ENDCG
	}
	FallBack "Diffuse"
}