Shader "Custom/TileTPMWorkspace" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_Diffuse ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0

		_FR ("R Scale", Range(0,10)) = 0.5
		
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _Diffuse; uniform float4 _Diffuse_ST;

		float _FR;

		struct Input
		{
			float3 worldPos;
			float3 worldNormal;
		};

		float4 TiledTPM (float3 normal, float3 position, float4 rgbaScale, float4 rgbaTile,  float baseScale, float baseTile, sampler2D tileSheet, float4 vertexColor)
		{
			float2 UVTile_Scale = float2(1.0/3.0,1.0/3.0); //3 tiles wide, three tiles tall, change if using a different tile setup
			float4 texResult;


		    normal *= normal * normal * normal;
		    normal = normal.rgb / (normal.r + normal.g + normal.b);

		    //R Tile Section -----------------------------------------------------------
		    float3 R_Pos = frac(position * rgbaScale.r);
			float R_UVTile_Y = floor(rgbaTile.r * UVTile_Scale.x);
			float R_UVTile_X = rgbaTile.r - 3 * R_UVTile_Y;
			float2 R_UVTile = float2(R_UVTile_X, R_UVTile_Y);

		    float4 tex1 = tex2Dlod(tileSheet,float4((R_Pos.rg + R_UVTile) * UVTile_Scale,0,0));
		    float4 tex2 = tex2Dlod(tileSheet,float4((R_Pos.rb + R_UVTile) * UVTile_Scale,0,0));
		    float4 tex3 = tex2Dlod(tileSheet,float4((R_Pos.gb + R_UVTile) * UVTile_Scale,0,0));
		    texResult = (tex1 * normal.b + tex2 * normal.g + tex3 * normal.r) * vertexColor.r;

		    //G Tile Section -----------------------------------------------------------
		    float3 G_Pos = frac(position * rgbaScale.g);
			float G_UVTile_Y = floor(rgbaTile.g * UVTile_Scale.x);
			float G_UVTile_X = rgbaTile.g - 3 * G_UVTile_Y;
			float2 G_UVTile = float2(G_UVTile_X, G_UVTile_Y);

		    tex1 = tex2Dlod(tileSheet,float4((G_Pos.rg + G_UVTile) * UVTile_Scale,0,0));
		    tex2 = tex2Dlod(tileSheet,float4((G_Pos.rb + G_UVTile) * UVTile_Scale,0,0));
		    tex3 = tex2Dlod(tileSheet,float4((G_Pos.gb + G_UVTile) * UVTile_Scale,0,0));
		    texResult += (tex1 * normal.b + tex2 * normal.g + tex3 * normal.r) * vertexColor.g;



		    //B Tile Section -----------------------------------------------------------
		    float3 B_Pos = frac(position*rgbaScale.b);
			float B_UVTile_Y = floor(rgbaTile.b * UVTile_Scale.x);
			float B_UVTile_X = rgbaTile.b - 3 * B_UVTile_Y;
			float2 B_UVTile = float2(B_UVTile_X, B_UVTile_Y);

		    tex1 = tex2Dlod(tileSheet,float4((B_Pos.rg + B_UVTile) * UVTile_Scale,0,0));
		    tex2 = tex2Dlod(tileSheet,float4((B_Pos.rb + B_UVTile) * UVTile_Scale,0,0));
		    tex3 = tex2Dlod(tileSheet,float4((B_Pos.gb + B_UVTile) * UVTile_Scale,0,0));
		    texResult += (tex1 * normal.b + tex2 * normal.g + tex3 * normal.r) * vertexColor.b;


		    //A Tile Section -----------------------------------------------------------
		    float3 A_Pos = frac(position * rgbaScale.a);
			float A_UVTile_Y = floor(rgbaTile.a * UVTile_Scale.x);
			float A_UVTile_X = rgbaTile.a - 3 * A_UVTile_Y;
			float2 A_UVTile = float2(A_UVTile_X, A_UVTile_Y);

		    tex1 = tex2Dlod(tileSheet,float4((A_Pos.rg + A_UVTile) * UVTile_Scale,0,0));
		    tex2 = tex2Dlod(tileSheet,float4((A_Pos.rb + A_UVTile) * UVTile_Scale,0,0));
		    tex3 = tex2Dlod(tileSheet,float4((A_Pos.gb + A_UVTile) * UVTile_Scale,0,0));
		    texResult += (tex1 * normal.b + tex2 * normal.g + tex3 * normal.r) * vertexColor.a;


		    //Base Tile Section ---------------------------------------------------------
		    float3 Base_Pos = frac(position * baseScale);
			float Base_UVTile_Y = floor(baseTile * UVTile_Scale.x);
			float Base_UVTile_X = baseTile - 3 * Base_UVTile_Y;
			float2 Base_UVTile = float2(Base_UVTile_X, Base_UVTile_Y);

		    tex1 = tex2Dlod(tileSheet,float4((Base_Pos.rg + Base_UVTile) * UVTile_Scale,0,0));
		    tex2 = tex2Dlod(tileSheet,float4((Base_Pos.rb + Base_UVTile) * UVTile_Scale,0,0));
		    tex3 = tex2Dlod(tileSheet,float4((Base_Pos.gb + Base_UVTile) * UVTile_Scale,0,0));
		    texResult += (tex1 * normal.b + tex2 * normal.g + tex3 * normal.r) * (1.0 - (vertexColor.r + vertexColor.g + vertexColor.b + vertexColor.a));
		    
		    return texResult;
		}

		half _Glossiness;
		half _Metallic;
		fixed4 _Color;

		void surf (Input IN, inout SurfaceOutputStandard o) {
			// Albedo comes from a texture tinted by color
			fixed4 c = TiledTPM(IN.worldNormal, IN.worldPos, float4(1,1,1,1), float4(0,1,2,3), 1, 4, _Diffuse, _Color);
			o.Albedo = c.rgb;
			// Metallic and smoothness come from slider variables
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = 1;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
