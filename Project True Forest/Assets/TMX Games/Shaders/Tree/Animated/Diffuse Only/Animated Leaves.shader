Shader "TMX/Tree/Animated Leaves"
{
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0

		_WindAnimation ("Wind Animation", Vector) = (1.234,1.828734,0.345,0.92345)
        _WindSpeed ("Wind Speed", Range(0, 1)) = 0.1
        _MaxWindDistance ("Max Wind Distance", Vector) = (1,1,1,0)
        _WindScale ("Wind Scale", Range(0, 1)) = 0.1
        _Clip ("Alpha Clip", Range(0, 1)) = 1
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
		};

		half _Glossiness;
		half _Metallic;
		fixed4 _Color;
		uniform half4 _WindAnimation;
		uniform half _WindSpeed;
        uniform half4 _MaxWindDistance;
        uniform half _WindScale;
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
		}

		void surf (Input IN, inout SurfaceOutputStandard o) {
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
			o.Albedo = c.rgb;
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = c.a;
			clip (c.a - _Clip);
		}
		ENDCG
	}
	FallBack "Diffuse"
}
