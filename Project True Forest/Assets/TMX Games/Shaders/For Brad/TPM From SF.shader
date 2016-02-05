Shader "Custom/TPM From Sf" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
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

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		half _Glossiness;
		half _Metallic;
		fixed4 _Color;

		float3 TPM (float3 normal, float3 position, float scale, sampler2D tex)
		{
			float3 absNorm = abs(normal);
			float r = absNorm.r;
			float g = absNorm.g;
			float b = absNorm.b;

			float3 norm1 = float3(-g, r, b);
			float3 norm2 = float3(-b, g, r);

			float3 norm3 = float3(g, -r, b);
			float3 norm4 = float3(r, -b, g);

			float3 norm5 = float3(b, g, -r);
			float3 norm6 = float3(r, b, -g);

//			position = position / scale;
			float3 tex1 = UnpackNormal(tex2D(tex, position.yz));
			float3 channelBlend1 = (tex1.r * norm1) + (tex1.g * norm2) + (tex1.b * normal);
			float3 tex2 = UnpackNormal(tex2D(tex, position.xz));
			float3 channelBlend2 = (tex2.r * norm3) + (tex2.g * norm4) + (tex2.b * normal);
			float3 tex3 = UnpackNormal(tex2D(tex, position.xy));
			float3 channelBlend3 = (tex3.r * norm5) + (tex3.g * norm6) + (tex3.b * normal);

			normal *= normal;

			return (channelBlend1 * normal.r) + (channelBlend2 * normal.g) + (channelBlend3 * normal.b);
		}

		void surf (Input IN, inout SurfaceOutputStandard o) {
			// Albedo comes from a texture tinted by color
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
			o.Albedo = c.rgb;
			// Metallic and smoothness come from slider variables
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
