//
Shader "Noise/Clouds No Normals" 
{
	Properties 
	{
		_Octaves ("Octaves", Float) = 8.0
		_Frequency ("Frequency", Float) = 1.0
		_Amplitude ("Amplitude", Float) = 1.0
		_Lacunarity ("Lacunarity", Float) = 1.92
		_Persistence ("Persistence", Float) = 0.8


		_Offset ("Animation Direction (W is Speed)", Vector) = (0.0, 0.0, 0.0, 0.0)
		_HorizonScaling ("Horizon Scaling", Range(1.0,20.0)) = 10.0

		_SunAddSaturation ("Sun Add Saturation", Range(0, 1)) = .2
		

		_CloudSoftness ("Cloud Softness", Range(0.9, 1.0)) = 0.75
		_CloudCoverage ("Cloud Coverage", Range(0.0, 1.0)) = 0.5
		_ColorGradient ("Base Color Gradient", 2D) = "white" { }
		_TimeGradient ("Time Of Day Gradient", 2D) = "white" { }
		_DayPercent ("Day Percent", Range(0,1)) = 1
		_DominantLightDirection ("Dominant Light Direction", Vector) = (0.0, 1.0, 0.0, 0.0)
	}

	CGINCLUDE
		void FAST32_hash_3D( 	float3 gridcell,
								float3 v1_mask,		//	user definable v1 and v2.  ( 0's and 1's )
								float3 v2_mask,
								out float4 hash_0,
								out float4 hash_1,
								out float4 hash_2	)		//	generates 3 random numbers for each of the 4 3D cell corners.  cell corners:  v0=0,0,0  v3=1,1,1  the other two are user definable
		{
			const float2 OFFSET = float2( 50.0, 161.0 );
			const float DOMAIN = 69.0;
			const float3 SOMELARGEFLOATS = float3( 635.298681, 682.357502, 668.926525 );
			const float3 ZINC = float3( 48.500388, 65.294118, 63.934599 );
		
			//	truncate the domain
			gridcell.xyz = gridcell.xyz - floor(gridcell.xyz * ( 1.0 / DOMAIN )) * DOMAIN;
			float3 gridcell_inc1 = step( gridcell, float3( DOMAIN - 1.5, DOMAIN - 1.5, DOMAIN - 1.5) ) * ( gridcell + 1.0 );
		
			//	compute x*x*y*y for the 4 corners
			float4 P = float4( gridcell.xy, gridcell_inc1.xy ) + OFFSET.xyxy;
			P *= P;
			float4 V1xy_V2xy = lerp( P.xyxy, P.zwzw, float4( v1_mask.xy, v2_mask.xy ) );		//	apply mask for v1 and v2
			P = float4( P.x, V1xy_V2xy.xz, P.z ) * float4( P.y, V1xy_V2xy.yw, P.w );
		
			//	get the lowz and highz mods
			float3 lowz_mods = float3( 1.0 / ( SOMELARGEFLOATS.xyz + gridcell.zzz * ZINC.xyz ) );
			float3 highz_mods = float3( 1.0 / ( SOMELARGEFLOATS.xyz + gridcell_inc1.zzz * ZINC.xyz ) );
		
			//	apply mask for v1 and v2 mod values
		    v1_mask = ( v1_mask.z < 0.5 ) ? lowz_mods : highz_mods;
		    v2_mask = ( v2_mask.z < 0.5 ) ? lowz_mods : highz_mods;
		
			//	compute the final hash
			hash_0 = frac( P * float4( lowz_mods.x, v1_mask.x, v2_mask.x, highz_mods.x ) );
			hash_1 = frac( P * float4( lowz_mods.y, v1_mask.y, v2_mask.y, highz_mods.y ) );
			hash_2 = frac( P * float4( lowz_mods.z, v1_mask.z, v2_mask.z, highz_mods.z ) );
		}
		//
		//	Given an arbitrary 3D point this calculates the 4 vectors from the corners of the simplex pyramid to the point
		//	It also returns the integer grid index information for the corners
		//
		void Simplex3D_GetCornerVectors( 	float3 P,					//	input point
											out float3 Pi,			//	integer grid index for the origin
											out float3 Pi_1,			//	offsets for the 2nd and 3rd corners.  ( the 4th = Pi + 1.0 )
											out float3 Pi_2,
											out float4 v1234_x,		//	vectors from the 4 corners to the intput point
											out float4 v1234_y,
											out float4 v1234_z )
		{
			//
			//	Simplex math from Stefan Gustavson's and Ian McEwan's work at...
			//	http://github.com/ashima/webgl-noise
			//
		
			//	simplex math constants
			const float SKEWFACTOR = 1.0/3.0;
			const float UNSKEWFACTOR = 1.0/6.0;
			const float SIMPLEX_CORNER_POS = 0.5;
			const float SIMPLEX_PYRAMID_HEIGHT = 0.70710678118654752440084436210485;	// sqrt( 0.5 )	height of simplex pyramid.
		
			P *= SIMPLEX_PYRAMID_HEIGHT;		// scale space so we can have an approx feature size of 1.0  ( optional )
		
			//	Find the vectors to the corners of our simplex pyramid
			Pi = floor( P + dot( P, float3( SKEWFACTOR, SKEWFACTOR, SKEWFACTOR) ) );
			float3 x0 = P - Pi + dot(Pi, float3( UNSKEWFACTOR, UNSKEWFACTOR, UNSKEWFACTOR ) );
			float3 g = step(x0.yzx, x0.xyz);
			float3 l = 1.0 - g;
			Pi_1 = min( g.xyz, l.zxy );
			Pi_2 = max( g.xyz, l.zxy );
			float3 x1 = x0 - Pi_1 + UNSKEWFACTOR;
			float3 x2 = x0 - Pi_2 + SKEWFACTOR;
			float3 x3 = x0 - SIMPLEX_CORNER_POS;
		
			//	pack them into a parallel-friendly arrangement
			v1234_x = float4( x0.x, x1.x, x2.x, x3.x );
			v1234_y = float4( x0.y, x1.y, x2.y, x3.y );
			v1234_z = float4( x0.z, x1.z, x2.z, x3.z );
		}
		//
		//	Calculate the weights for the 3D simplex surflet
		//
		float4 Simplex3D_GetSurfletWeights( 	float4 v1234_x,
											float4 v1234_y,
											float4 v1234_z )
		{
			//	perlins original implementation uses the surlet falloff formula of (0.6-x*x)^4.
			//	This is buggy as it can cause discontinuities along simplex faces.  (0.5-x*x)^3 solves this and gives an almost identical curve
		
			//	evaluate surflet. f(x)=(0.5-x*x)^3
			float4 surflet_weights = v1234_x * v1234_x + v1234_y * v1234_y + v1234_z * v1234_z;
			surflet_weights = max(0.5 - surflet_weights, 0.0);		//	0.5 here represents the closest distance (squared) of any simplex pyramid corner to any of its planes.  ie, SIMPLEX_PYRAMID_HEIGHT^2
			return surflet_weights*surflet_weights*surflet_weights;
		}

		float SimplexPerlin3D(float3 P)
		{
			//	calculate the simplex vector and index math
			float3 Pi;
			float3 Pi_1;
			float3 Pi_2;
			float4 v1234_x;
			float4 v1234_y;
			float4 v1234_z;
			Simplex3D_GetCornerVectors( P, Pi, Pi_1, Pi_2, v1234_x, v1234_y, v1234_z );
		
			//	generate the random vectors
			//	( various hashing methods listed in order of speed )
			float4 hash_0;
			float4 hash_1;
			float4 hash_2;
			FAST32_hash_3D( Pi, Pi_1, Pi_2, hash_0, hash_1, hash_2 );
			hash_0 -= 0.49999;
			hash_1 -= 0.49999;
			hash_2 -= 0.49999;
		
			//	evaluate gradients
			float4 grad_results = rsqrt( hash_0 * hash_0 + hash_1 * hash_1 + hash_2 * hash_2 ) * ( hash_0 * v1234_x + hash_1 * v1234_y + hash_2 * v1234_z );
			
			const float FINAL_NORMALIZATION = 37.837227241611314102871574478976;
		
			//	sum with the surflet and return
			return dot( Simplex3D_GetSurfletWeights( v1234_x, v1234_y, v1234_z ), grad_results ) * FINAL_NORMALIZATION;
		}
		half SimplexNormal(float3 p, int octaves, half frequency, half amplitude, half lacunarity, half persistence)
		{
			half sum = 0;
			for (int i = 0; i < octaves; i++)
			{
				half h = 0;
				h = SimplexPerlin3D(p * frequency);
				sum += h*amplitude;
				frequency *= lacunarity;
				amplitude *= persistence;
			}
			return sum * 0.5 + 0.5;
		}

	ENDCG

	SubShader 
	{
		Tags {"Queue"="Transparent"}

		Blend SrcAlpha OneMinusSrcAlpha

		
		CGPROGRAM
		#pragma surface surf Lambert vertex:vert alpha noambient noforwardadd
		#pragma glsl
		#pragma target 3.0
		
		fixed _Octaves;
		half _Frequency;
		half _Amplitude;
		float4 _Offset;
		half _Lacunarity;
		half _Persistence;
		half _AnimSpeed;
		sampler2D _ColorGradient;
		sampler2D _TimeGradient;
		fixed _CloudSoftness;
		fixed _CloudCoverage;

		fixed _DayPercent;
		half4 _DominantLightDirection;

		half _SunAddSaturation;
		half _HorizonScaling;

		struct Input 
		{
			half3 pos;
			fixed4 color;
			float3 worldPos;
			float3 viewDir;
			fixed4 timeOfDayColor;
		};

		half ApplyCloudCoverage (half h)
		{
			float density = saturate(h - (1 - (0.15 + _CloudCoverage))) * 200;
			return 1.0 - pow(_CloudSoftness, density);
		}

		half4 GetBaseGradientColor (half h)
		{
			return tex2Dlod(_ColorGradient, half4(h, 0.0, 0.0, 0.0));
		}

		void vert (inout appdata_full v, out Input OUT)
		{
			UNITY_INITIALIZE_OUTPUT(Input, OUT);

			float2 modifiedUV = v.texcoord.xy - float2(0.5,0.5);
//			modifiedUV *= 1.0 + (sin(length(modifiedUV) * 2.221441431) * _HorizonScaling);
			float uvLength = length(modifiedUV);
			modifiedUV *= 1.0 + (uvLength * _HorizonScaling);
			OUT.pos = float3(modifiedUV, 0) + _Offset.xyz * _Time.x * _Offset.w;
			OUT.color = v.color;
			OUT.timeOfDayColor = tex2Dlod(_TimeGradient, half4(_DayPercent, 0.0, 0.0, 0.0));
		}

		void surf (Input IN, inout SurfaceOutput o) 
		{
			float h = SimplexNormal(IN.pos, _Octaves, _Frequency, _Amplitude, _Lacunarity, _Persistence);
			
			float4 color = GetBaseGradientColor(ApplyCloudCoverage(h));

			float3 lightDir = -normalize(_WorldSpaceLightPos0.xyz);
			lightDir.y *= -1;

			fixed3 sunColor = _LightColor0.rgb;
			float desaturatedSunColor = (sunColor.r + sunColor.g + sunColor.b) / 3.0;
			fixed3 sunAddColor = lerp(fixed3(1.0,1.0,1.0), sunColor.rgb / desaturatedSunColor, _SunAddSaturation);

			float lookingAtSun = saturate((dot(IN.viewDir, _DominantLightDirection.xyz) + 1.2) / 2.2);

			lookingAtSun *= lookingAtSun;
			lookingAtSun = 1.0 - cos(lookingAtSun * 1.57079632);
			lookingAtSun = 1.0 - cos(lookingAtSun * 1.57079632);
//			lookingAtSun = 1.0 - cos(lookingAtSun * 1.57079632);
			lookingAtSun *= lookingAtSun * lookingAtSun;
			lookingAtSun = lookingAtSun * lookingAtSun * (3.0 - 2.0 * lookingAtSun);
			lookingAtSun = lookingAtSun * lookingAtSun * (3.0 - 2.0 * lookingAtSun);

			float alpha = saturate(color.a);

//			float alphaModifier = saturate((alpha - .9) / .1 - .2);
			float alphaModifier = saturate(alpha - .1);
			alphaModifier = alphaModifier * alphaModifier * (3 - 2 * alphaModifier);
			alphaModifier *= alphaModifier * alphaModifier * alphaModifier * alphaModifier * alphaModifier;
			lookingAtSun *= (1 - alphaModifier) * (1 - (1 - _DominantLightDirection.w) * (1 - _DominantLightDirection.w));

			float horizonFalloff = IN.color.r;
//			float horizonFalloff = 1 - IN.color.r;
			horizonFalloff *= horizonFalloff;
//			horizonFalloff = 1 - horizonFalloff;
			o.Alpha = alpha * horizonFalloff;
			o.Emission = lerp(color.rgb * IN.timeOfDayColor.rgb, sunAddColor.rgb, lookingAtSun);
			o.Albedo = lerp(color.rgb * IN.timeOfDayColor.a, sunAddColor.rgb, lookingAtSun);
		}
		ENDCG
	}
	
	FallBack "Diffuse"
}