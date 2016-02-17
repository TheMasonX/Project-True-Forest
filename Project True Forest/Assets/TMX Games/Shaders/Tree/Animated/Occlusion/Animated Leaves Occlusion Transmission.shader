Shader "TMX/Tree/Animated Leaves Occlusion and Transmission"
{
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_OcclusionColor ("Vertex Occlusion Color", Color) = (.2,.2,.2,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0

		_WindAnimation ("Wind Animation", Vector) = (1.234,1.828734,0.345,0.92345)
        _WindSpeed ("Wind Speed", Range(0, 1)) = 0.1
        _MaxWindDistance ("Max Wind Distance", Vector) = (1,1,1,0)
        _WindScale ("Wind Scale", Range(0, .15)) = 0.1
        _Clip ("Alpha Clip", Range(0, 1)) = 1

        _LightTransmission ("Backside Transmission", Range(0,1)) = 0.0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		Cull Off
		
		CGPROGRAM
		#pragma surface surf Standard vertex:vert addshadow

		#pragma target 3.0

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
			float4 vertexColor;
			float3 viewDir;
			float3 worldNormal;
		};

		half _Glossiness;
		half _Metallic;
		fixed4 _Color;
		fixed4 _OcclusionColor;
		uniform half4 _WindAnimation;
		uniform half _WindSpeed;
        uniform half4 _MaxWindDistance;
        uniform half _WindScale;
       	uniform half _LightTransmission;
        half _Clip;

        float3 GetWind( float3 position)
        {
        	float time = _Time.y * _WindSpeed;
            float xAnim = sin(time * _WindAnimation.x + position.x + .23421) + cos(time * _WindAnimation.w + position.x + 1.7321);
            float yAnim = sin(time * _WindAnimation.y + position.y - .73421) + cos(time * _WindAnimation.z + position.y - 2.42423);
            float zAnim = sin(time * _WindAnimation.z + position.z + 2.73658) + cos(time * _WindAnimation.x + position.z - .81359);
            return _MaxWindDistance.xyz * float3(xAnim, yAnim, zAnim);
        }

		void vert (inout appdata_full v, out Input OUT)
		{
			UNITY_INITIALIZE_OUTPUT(Input, OUT);
			float3 pos = mul ( _Object2World, v.vertex).xyz;
			v.vertex.xyz += GetWind(pos) * v.color.r;
			OUT.vertexColor = v.color.rgba;
		}

		void surf (Input IN, inout SurfaceOutputStandard o)
		{
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
			o.Albedo = c.rgb * lerp(fixed4(1.0,1.0,1.0,1.0), _OcclusionColor, IN.vertexColor.g);
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = c.a;

//			float backSideDot = 1 - saturate(-dot(IN.viewDir, IN.worldNormal));
//			backSideDot *= backSideDot;
			float backSideDiffuse = saturate(dot(-_WorldSpaceLightPos0.xyz, IN.viewDir) - .3 / .7);
//			backSideDiffuse *= backSideDiffuse;
			float occlusionMultiplier = 1 - IN.vertexColor.g;
			o.Emission = _LightColor0.rgb * occlusionMultiplier * _LightTransmission * backSideDiffuse * c.rgb;
//			o.Emission = _LightColor0.rgb * (1 - backSideDot) * (1 - backSideDiffuse) * transmissionAmount;

			clip (c.a - _Clip);
		}
		ENDCG
	}
	FallBack "Diffuse"
}
