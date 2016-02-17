// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4795,x:33178,y:32778,varname:node_4795,prsc:2|emission-8668-OUT,clip-6074-A;n:type:ShaderForge.SFN_Tex2d,id:6074,x:32259,y:32912,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:07b25def8ab9e9b4ebf3ff7c7af0de8b,ntxv:0,isnm:False;n:type:ShaderForge.SFN_TexCoord,id:1365,x:31191,y:32776,varname:node_1365,prsc:2,uv:0;n:type:ShaderForge.SFN_RemapRange,id:9229,x:31437,y:32776,varname:node_9229,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-1365-UVOUT;n:type:ShaderForge.SFN_Append,id:9546,x:31910,y:32896,varname:node_9546,prsc:2|A-2977-OUT,B-6540-OUT,C-5581-OUT;n:type:ShaderForge.SFN_Normalize,id:3119,x:32201,y:32716,varname:node_3119,prsc:2|IN-9546-OUT;n:type:ShaderForge.SFN_Slider,id:3167,x:31007,y:32331,ptovrint:False,ptlb:MoonPhase,ptin:_MoonPhase,varname:_MoonPhase,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:8526,x:31640,y:32371,varname:node_8526,prsc:2|A-9586-OUT,B-4375-OUT;n:type:ShaderForge.SFN_Tau,id:4375,x:31415,y:32476,varname:node_4375,prsc:2;n:type:ShaderForge.SFN_Cos,id:8477,x:31826,y:32236,varname:node_8477,prsc:2|IN-8526-OUT;n:type:ShaderForge.SFN_Vector1,id:5718,x:31826,y:32385,varname:node_5718,prsc:2,v1:0;n:type:ShaderForge.SFN_Sin,id:498,x:31826,y:32445,varname:node_498,prsc:2|IN-8526-OUT;n:type:ShaderForge.SFN_Append,id:949,x:32026,y:32372,varname:node_949,prsc:2|A-8477-OUT,B-5718-OUT,C-498-OUT;n:type:ShaderForge.SFN_Dot,id:2937,x:32552,y:32518,cmnt:Faked Lambert,varname:node_2937,prsc:2,dt:0|A-949-OUT,B-9307-OUT;n:type:ShaderForge.SFN_Add,id:9586,x:31415,y:32319,varname:node_9586,prsc:2|A-176-OUT,B-3167-OUT;n:type:ShaderForge.SFN_Vector1,id:176,x:31230,y:32249,varname:node_176,prsc:2,v1:0.25;n:type:ShaderForge.SFN_Length,id:3433,x:31693,y:32624,varname:node_3433,prsc:2|IN-9229-OUT;n:type:ShaderForge.SFN_Multiply,id:8668,x:32825,y:32816,varname:node_8668,prsc:2|A-6209-OUT,B-6074-RGB;n:type:ShaderForge.SFN_OneMinus,id:5581,x:31915,y:32765,varname:node_5581,prsc:2|IN-2145-OUT;n:type:ShaderForge.SFN_OneMinus,id:5344,x:32567,y:32152,varname:node_5344,prsc:2|IN-9545-OUT;n:type:ShaderForge.SFN_Multiply,id:3942,x:32775,y:32164,varname:node_3942,prsc:2|A-5344-OUT,B-5344-OUT,C-5344-OUT,D-5344-OUT;n:type:ShaderForge.SFN_Multiply,id:8635,x:32982,y:32187,varname:node_8635,prsc:2|A-3942-OUT,B-3942-OUT,C-3942-OUT,D-3942-OUT;n:type:ShaderForge.SFN_OneMinus,id:6209,x:32944,y:32413,varname:node_6209,prsc:2|IN-3532-OUT;n:type:ShaderForge.SFN_Clamp01,id:2145,x:31915,y:32624,varname:node_2145,prsc:2|IN-3433-OUT;n:type:ShaderForge.SFN_Multiply,id:4882,x:31398,y:32985,varname:node_4882,prsc:2|A-1365-U,B-4338-OUT;n:type:ShaderForge.SFN_Pi,id:4338,x:31138,y:33132,varname:node_4338,prsc:2;n:type:ShaderForge.SFN_Cos,id:2776,x:31561,y:32985,varname:node_2776,prsc:2|IN-4882-OUT;n:type:ShaderForge.SFN_Negate,id:2977,x:31724,y:32985,varname:node_2977,prsc:2|IN-2776-OUT;n:type:ShaderForge.SFN_Multiply,id:5454,x:31398,y:33112,varname:node_5454,prsc:2|A-1365-V,B-4338-OUT;n:type:ShaderForge.SFN_Cos,id:9834,x:31561,y:33112,varname:node_9834,prsc:2|IN-5454-OUT;n:type:ShaderForge.SFN_Negate,id:6540,x:31724,y:33112,varname:node_6540,prsc:2|IN-9834-OUT;n:type:ShaderForge.SFN_Multiply,id:3532,x:32772,y:32370,varname:node_3532,prsc:2|A-8635-OUT,B-8635-OUT;n:type:ShaderForge.SFN_RemapRange,id:4119,x:32239,y:32158,varname:node_4119,prsc:2,frmn:-0.05,frmx:1,tomn:0,tomx:1|IN-2937-OUT;n:type:ShaderForge.SFN_Clamp01,id:2487,x:32407,y:32158,varname:node_2487,prsc:2|IN-4119-OUT;n:type:ShaderForge.SFN_Tex2d,id:2125,x:31961,y:33259,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:node_2125,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:308312f953f7d3343bfe9e6cbb0f2e7d,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Lerp,id:9307,x:32525,y:32756,varname:node_9307,prsc:2|A-3119-OUT,B-1850-OUT,T-5750-OUT;n:type:ShaderForge.SFN_NormalBlend,id:1850,x:32266,y:33215,varname:node_1850,prsc:2|BSE-3119-OUT,DTL-2125-RGB;n:type:ShaderForge.SFN_Slider,id:5750,x:32438,y:33101,ptovrint:False,ptlb:Normal Strength,ptin:_NormalStrength,varname:node_5750,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2307807,max:1;n:type:ShaderForge.SFN_Code,id:9545,x:32476,y:31941,varname:node_9545,prsc:2,code:cgBlAHQAdQByAG4AIAB4ACAAKgAgAHgAIAAqACAAKAAzACAALQAgADIAIAAqACAAeAApADsA,output:0,fname:Hermite,width:247,height:132,input:0,input_1_label:x|A-2487-OUT;proporder:6074-3167-2125-5750;pass:END;sub:END;*/

Shader "TMX/Moon/Simple" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _MoonPhase ("MoonPhase", Range(0, 1)) = 0
        _Normal ("Normal", 2D) = "bump" {}
        _NormalStrength ("Normal Strength", Range(0, 1)) = 0.2307807
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _MoonPhase;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _NormalStrength;
            float Hermite( float x ){
            return x * x * (3 - 2 * x);
            }
            
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(_MainTex_var.a - 0.5);
////// Lighting:
////// Emissive:
                float node_4375 = 6.28318530718;
                float node_8526 = ((0.25+_MoonPhase)*node_4375);
                float3 node_949 = float3(cos(node_8526),0.0,sin(node_8526));
                float node_4338 = 3.141592654;
                float node_4882 = (i.uv0.r*node_4338);
                float2 node_9229 = (i.uv0*2.0+-1.0);
                float node_3433 = length(node_9229);
                float node_2145 = saturate(node_3433);
                float3 node_9546 = float3((-1*cos(node_4882)),(-1*cos((i.uv0.g*node_4338))),(1.0 - node_2145));
                float3 node_3119 = normalize(node_9546);
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal)));
                float3 node_1850_nrm_base = node_3119 + float3(0,0,1);
                float3 node_1850_nrm_detail = _Normal_var.rgb * float3(-1,-1,1);
                float3 node_1850_nrm_combined = node_1850_nrm_base*dot(node_1850_nrm_base, node_1850_nrm_detail)/node_1850_nrm_base.z - node_1850_nrm_detail;
                float3 node_1850 = node_1850_nrm_combined;
                float node_2937 = dot(node_949,lerp(node_3119,node_1850,_NormalStrength)); // Faked Lambert
                float node_5344 = (1.0 - Hermite( saturate((node_2937*0.952381+0.04761905)) ));
                float node_3942 = (node_5344*node_5344*node_5344*node_5344);
                float node_8635 = (node_3942*node_3942*node_3942*node_3942);
                float node_6209 = (1.0 - (node_8635*node_8635));
                float3 emissive = (node_6209*_MainTex_var.rgb);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(_MainTex_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
