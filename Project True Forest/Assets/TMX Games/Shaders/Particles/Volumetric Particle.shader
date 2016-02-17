// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.4823529,fgcg:0.4823529,fgcb:0.6117647,fgca:0.5490196,fgde:0.002607843,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:8440,x:32767,y:32695,varname:node_8440,prsc:2|custl-635-OUT,alpha-6549-OUT;n:type:ShaderForge.SFN_Tex2d,id:5936,x:32121,y:32635,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_5936,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5b303ff28ad9368468a2edd759cf458d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ViewVector,id:5263,x:31244,y:33255,varname:node_5263,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:1692,x:31244,y:33386,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:3914,x:31425,y:33313,varname:node_3914,prsc:2,dt:3|A-5263-OUT,B-1692-OUT;n:type:ShaderForge.SFN_Multiply,id:2472,x:31580,y:33289,varname:node_2472,prsc:2|A-3914-OUT,B-3914-OUT;n:type:ShaderForge.SFN_Multiply,id:6549,x:32446,y:32850,varname:node_6549,prsc:2|A-5936-A,B-5139-OUT,C-5872-A;n:type:ShaderForge.SFN_RemapRange,id:2846,x:31778,y:33271,varname:node_2846,prsc:2,frmn:0.125,frmx:0.6,tomn:0,tomx:1|IN-2472-OUT;n:type:ShaderForge.SFN_Clamp01,id:5139,x:31929,y:33241,varname:node_5139,prsc:2|IN-2846-OUT;n:type:ShaderForge.SFN_ObjectPosition,id:4878,x:32360,y:33346,varname:node_4878,prsc:2;n:type:ShaderForge.SFN_FragmentPosition,id:402,x:32359,y:33188,varname:node_402,prsc:2;n:type:ShaderForge.SFN_Subtract,id:6644,x:32542,y:33276,varname:node_6644,prsc:2|A-402-XYZ,B-4878-XYZ;n:type:ShaderForge.SFN_Multiply,id:7146,x:33815,y:33837,varname:node_7146,prsc:2|A-3535-OUT,B-4030-OUT,C-2151-RGB;n:type:ShaderForge.SFN_LightAttenuation,id:4030,x:33502,y:33869,varname:node_4030,prsc:2;n:type:ShaderForge.SFN_LightColor,id:2151,x:33491,y:34000,varname:node_2151,prsc:2;n:type:ShaderForge.SFN_Set,id:4179,x:34093,y:33736,varname:CustomLighting,prsc:2|IN-7146-OUT;n:type:ShaderForge.SFN_Get,id:2935,x:32359,y:33038,varname:node_2935,prsc:2|IN-4179-OUT;n:type:ShaderForge.SFN_Color,id:5872,x:32121,y:32830,ptovrint:False,ptlb:Tint,ptin:_Tint,varname:node_5872,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4705882,c2:0.4705882,c3:0.4705882,c4:0.5;n:type:ShaderForge.SFN_Multiply,id:5629,x:32357,y:32652,varname:node_5629,prsc:2|A-5936-RGB,B-5872-RGB;n:type:ShaderForge.SFN_ObjectPosition,id:1850,x:32371,y:33743,varname:node_1850,prsc:2;n:type:ShaderForge.SFN_Add,id:1653,x:32604,y:33768,cmnt:Get the area where the light first hit the particle,varname:node_1653,prsc:2|A-256-OUT,B-1850-XYZ;n:type:ShaderForge.SFN_Relay,id:9360,x:32774,y:33951,varname:node_9360,prsc:2|IN-6644-OUT;n:type:ShaderForge.SFN_Subtract,id:998,x:32925,y:33834,varname:node_998,prsc:2|A-1653-OUT,B-9360-OUT;n:type:ShaderForge.SFN_Length,id:5693,x:33089,y:33834,varname:node_5693,prsc:2|IN-998-OUT;n:type:ShaderForge.SFN_Divide,id:690,x:33248,y:33834,varname:node_690,prsc:2|A-5693-OUT,B-1720-OUT;n:type:ShaderForge.SFN_Slider,id:3448,x:32710,y:34072,ptovrint:False,ptlb:Max Lighting Penetration Distance,ptin:_MaxLightingPenetrationDistance,varname:node_3448,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:1.639404,max:50;n:type:ShaderForge.SFN_Clamp01,id:959,x:33248,y:33988,varname:node_959,prsc:2|IN-690-OUT;n:type:ShaderForge.SFN_OneMinus,id:136,x:33248,y:34143,varname:node_136,prsc:2|IN-959-OUT;n:type:ShaderForge.SFN_Power,id:4694,x:33433,y:34162,varname:node_4694,prsc:2|VAL-136-OUT,EXP-753-OUT;n:type:ShaderForge.SFN_Slider,id:753,x:33106,y:34431,ptovrint:False,ptlb:Particle Density,ptin:_ParticleDensity,varname:node_753,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.0001,cur:8.427752,max:10;n:type:ShaderForge.SFN_Multiply,id:635,x:32553,y:32740,varname:node_635,prsc:2|A-5629-OUT,B-2935-OUT;n:type:ShaderForge.SFN_ObjectScale,id:7773,x:32828,y:33366,varname:node_7773,prsc:2,rcp:False;n:type:ShaderForge.SFN_Add,id:5517,x:33060,y:33360,varname:node_5517,prsc:2|A-7773-X,B-7773-Y,C-7773-Z;n:type:ShaderForge.SFN_Divide,id:1972,x:33227,y:33360,varname:node_1972,prsc:2|A-5517-OUT,B-5749-OUT;n:type:ShaderForge.SFN_Vector1,id:5749,x:33060,y:33493,varname:node_5749,prsc:2,v1:3;n:type:ShaderForge.SFN_Multiply,id:1720,x:33077,y:34016,varname:node_1720,prsc:2|A-1972-OUT,B-3448-OUT;n:type:ShaderForge.SFN_LightPosition,id:5036,x:32392,y:33569,varname:node_5036,prsc:2;n:type:ShaderForge.SFN_Subtract,id:4196,x:32550,y:33569,varname:node_4196,prsc:2|A-5036-XYZ,B-1850-XYZ;n:type:ShaderForge.SFN_Normalize,id:6532,x:32717,y:33569,varname:node_6532,prsc:2|IN-4196-OUT;n:type:ShaderForge.SFN_Multiply,id:256,x:32897,y:33569,varname:node_256,prsc:2|A-6532-OUT,B-1972-OUT,C-9298-OUT;n:type:ShaderForge.SFN_Vector1,id:9298,x:32644,y:33481,varname:node_9298,prsc:2,v1:0.5;n:type:ShaderForge.SFN_RemapRange,id:3444,x:33623,y:34225,varname:node_3444,prsc:2,frmn:0,frmx:0.9,tomn:0,tomx:1|IN-4694-OUT;n:type:ShaderForge.SFN_Clamp01,id:3535,x:33791,y:34201,varname:node_3535,prsc:2|IN-3444-OUT;proporder:5936-5872-3448-753;pass:END;sub:END;*/

Shader "Custom/Volumetric Particle" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Tint ("Tint", Color) = (0.4705882,0.4705882,0.4705882,0.5)
        _MaxLightingPenetrationDistance ("Max Lighting Penetration Distance", Range(0.01, 50)) = 1.639404
        _ParticleDensity ("Particle Density", Range(0.0001, 10)) = 8.427752
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _Tint;
            uniform float _MaxLightingPenetrationDistance;
            uniform float _ParticleDensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 objPos = mul ( _Object2World, float4(0,0,0,1) );
                float3 recipObjScale = float3( length(_World2Object[0].xyz), length(_World2Object[1].xyz), length(_World2Object[2].xyz) );
                float3 objScale = 1.0/recipObjScale;
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 objPos = mul ( _Object2World, float4(0,0,0,1) );
                float3 recipObjScale = float3( length(_World2Object[0].xyz), length(_World2Object[1].xyz), length(_World2Object[2].xyz) );
                float3 objScale = 1.0/recipObjScale;
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = 1;
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float node_5517 = (objScale.r+objScale.g+objScale.b);
                float node_1972 = (node_5517/3.0);
                float3 node_6644 = (i.posWorld.rgb-objPos.rgb);
                float node_5693 = length((((normalize((_WorldSpaceLightPos0.rgb-objPos.rgb))*node_1972*0.5)+objPos.rgb)-node_6644));
                float node_690 = (node_5693/(node_1972*_MaxLightingPenetrationDistance));
                float node_136 = (1.0 - saturate(node_690));
                float node_4694 = pow(node_136,_ParticleDensity);
                float3 node_7146 = (saturate((node_4694*1.111111+0.0))*attenuation*_LightColor0.rgb);
                float3 CustomLighting = node_7146;
                float3 finalColor = ((_MainTex_var.rgb*_Tint.rgb)*CustomLighting);
                float node_3914 = abs(dot(viewDirection,i.normalDir));
                fixed4 finalRGBA = fixed4(finalColor,(_MainTex_var.a*saturate(((node_3914*node_3914)*2.105263+-0.2631579))*_Tint.a));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float4 _Tint;
            uniform float _MaxLightingPenetrationDistance;
            uniform float _ParticleDensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                float4 objPos = mul ( _Object2World, float4(0,0,0,1) );
                float3 recipObjScale = float3( length(_World2Object[0].xyz), length(_World2Object[1].xyz), length(_World2Object[2].xyz) );
                float3 objScale = 1.0/recipObjScale;
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 objPos = mul ( _Object2World, float4(0,0,0,1) );
                float3 recipObjScale = float3( length(_World2Object[0].xyz), length(_World2Object[1].xyz), length(_World2Object[2].xyz) );
                float3 objScale = 1.0/recipObjScale;
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float node_5517 = (objScale.r+objScale.g+objScale.b);
                float node_1972 = (node_5517/3.0);
                float3 node_6644 = (i.posWorld.rgb-objPos.rgb);
                float node_5693 = length((((normalize((_WorldSpaceLightPos0.rgb-objPos.rgb))*node_1972*0.5)+objPos.rgb)-node_6644));
                float node_690 = (node_5693/(node_1972*_MaxLightingPenetrationDistance));
                float node_136 = (1.0 - saturate(node_690));
                float node_4694 = pow(node_136,_ParticleDensity);
                float3 node_7146 = (saturate((node_4694*1.111111+0.0))*attenuation*_LightColor0.rgb);
                float3 CustomLighting = node_7146;
                float3 finalColor = ((_MainTex_var.rgb*_Tint.rgb)*CustomLighting);
                float node_3914 = abs(dot(viewDirection,i.normalDir));
                fixed4 finalRGBA = fixed4(finalColor * (_MainTex_var.a*saturate(((node_3914*node_3914)*2.105263+-0.2631579))*_Tint.a),0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
