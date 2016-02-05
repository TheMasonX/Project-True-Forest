// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:False,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4795,x:33178,y:32778,varname:node_4795,prsc:2|emission-3328-OUT,alpha-6195-OUT;n:type:ShaderForge.SFN_Tex2d,id:6074,x:31904,y:32624,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:07b25def8ab9e9b4ebf3ff7c7af0de8b,ntxv:0,isnm:False|UVIN-9176-OUT;n:type:ShaderForge.SFN_Slider,id:9707,x:30645,y:32540,ptovrint:False,ptlb:Moon Size,ptin:_MoonSize,varname:node_9707,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.1,cur:0.5092858,max:1;n:type:ShaderForge.SFN_Divide,id:1842,x:31004,y:32512,varname:node_1842,prsc:2|A-4288-OUT,B-9707-OUT;n:type:ShaderForge.SFN_Vector1,id:4288,x:30802,y:32457,varname:node_4288,prsc:2,v1:1;n:type:ShaderForge.SFN_TexCoord,id:1365,x:30923,y:32661,varname:node_1365,prsc:2,uv:0;n:type:ShaderForge.SFN_RemapRange,id:9229,x:31100,y:32661,varname:node_9229,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-1365-UVOUT;n:type:ShaderForge.SFN_Multiply,id:1276,x:31423,y:32523,varname:node_1276,prsc:2|A-1842-OUT,B-9229-OUT;n:type:ShaderForge.SFN_OneMinus,id:7037,x:31733,y:32047,varname:node_7037,prsc:2|IN-3433-OUT;n:type:ShaderForge.SFN_Append,id:9546,x:32095,y:32367,varname:node_9546,prsc:2|A-1276-OUT,B-2212-OUT;n:type:ShaderForge.SFN_Normalize,id:3119,x:32253,y:32367,varname:node_3119,prsc:2|IN-9546-OUT;n:type:ShaderForge.SFN_Relay,id:3980,x:32436,y:31992,varname:node_3980,prsc:2|IN-3119-OUT;n:type:ShaderForge.SFN_Slider,id:3167,x:30356,y:31768,ptovrint:False,ptlb:MoonPhase,ptin:_MoonPhase,varname:node_3167,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:8526,x:30923,y:31793,varname:node_8526,prsc:2|A-9586-OUT,B-4375-OUT;n:type:ShaderForge.SFN_Tau,id:4375,x:30754,y:31879,varname:node_4375,prsc:2;n:type:ShaderForge.SFN_Cos,id:8477,x:31109,y:31658,varname:node_8477,prsc:2|IN-8526-OUT;n:type:ShaderForge.SFN_Vector1,id:5718,x:31109,y:31807,varname:node_5718,prsc:2,v1:0;n:type:ShaderForge.SFN_Sin,id:498,x:31109,y:31867,varname:node_498,prsc:2|IN-8526-OUT;n:type:ShaderForge.SFN_Append,id:949,x:31309,y:31794,varname:node_949,prsc:2|A-8477-OUT,B-5718-OUT,C-498-OUT;n:type:ShaderForge.SFN_Dot,id:2937,x:31649,y:31816,cmnt:Faked Lambert,varname:node_2937,prsc:2,dt:0|A-949-OUT,B-3980-OUT;n:type:ShaderForge.SFN_Relay,id:372,x:32576,y:31803,varname:node_372,prsc:2|IN-5647-OUT;n:type:ShaderForge.SFN_Multiply,id:4001,x:32520,y:32564,varname:node_4001,prsc:2|A-2159-OUT,B-4358-OUT;n:type:ShaderForge.SFN_Add,id:9586,x:30698,y:31741,varname:node_9586,prsc:2|A-176-OUT,B-3167-OUT;n:type:ShaderForge.SFN_Vector1,id:176,x:30513,y:31671,varname:node_176,prsc:2,v1:0.25;n:type:ShaderForge.SFN_Step,id:9923,x:32095,y:32135,varname:node_9923,prsc:2|A-7037-OUT,B-4716-OUT;n:type:ShaderForge.SFN_Vector1,id:4716,x:31893,y:32157,varname:node_4716,prsc:2,v1:0;n:type:ShaderForge.SFN_OneMinus,id:7396,x:32282,y:32135,varname:node_7396,prsc:2|IN-9923-OUT;n:type:ShaderForge.SFN_Multiply,id:4358,x:32128,y:32580,varname:node_4358,prsc:2|A-6205-OUT,B-6074-RGB;n:type:ShaderForge.SFN_Relay,id:9176,x:31799,y:32636,varname:node_9176,prsc:2|IN-413-UVOUT;n:type:ShaderForge.SFN_Multiply,id:1196,x:31004,y:32380,varname:node_1196,prsc:2|A-4323-OUT,B-1842-OUT;n:type:ShaderForge.SFN_Vector1,id:4323,x:30802,y:32333,varname:node_4323,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:4052,x:31255,y:32355,varname:node_4052,prsc:2|A-1196-OUT,B-9229-OUT;n:type:ShaderForge.SFN_Panner,id:413,x:31482,y:32345,varname:node_413,prsc:2,spu:1,spv:1|UVIN-4052-OUT,DIST-1369-OUT;n:type:ShaderForge.SFN_Vector1,id:1369,x:31324,y:32287,varname:node_1369,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:4309,x:32124,y:32697,varname:node_4309,prsc:2|A-6205-OUT,B-6074-A;n:type:ShaderForge.SFN_Relay,id:6205,x:32154,y:32537,cmnt:Moon Cutout,varname:node_6205,prsc:2|IN-7396-OUT;n:type:ShaderForge.SFN_OneMinus,id:5298,x:31844,y:31590,varname:node_5298,prsc:2|IN-2937-OUT;n:type:ShaderForge.SFN_Multiply,id:7246,x:32039,y:31502,varname:node_7246,prsc:2|A-5298-OUT,B-5298-OUT,C-5298-OUT,D-5298-OUT;n:type:ShaderForge.SFN_OneMinus,id:4059,x:32390,y:31569,varname:node_4059,prsc:2|IN-4133-OUT;n:type:ShaderForge.SFN_Multiply,id:3357,x:32039,y:31616,varname:node_3357,prsc:2|A-7246-OUT,B-7246-OUT,C-7246-OUT,D-7246-OUT;n:type:ShaderForge.SFN_Relay,id:4974,x:32658,y:32375,varname:node_4974,prsc:2|IN-372-OUT;n:type:ShaderForge.SFN_Slider,id:3422,x:29919,y:33016,ptovrint:False,ptlb:Glow Size,ptin:_GlowSize,varname:_MoonSize_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.1,cur:0.7707924,max:1;n:type:ShaderForge.SFN_Divide,id:4420,x:30267,y:32963,varname:node_4420,prsc:2|A-6126-OUT,B-3422-OUT;n:type:ShaderForge.SFN_Vector1,id:6126,x:30076,y:32933,varname:node_6126,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:2675,x:30463,y:32903,varname:node_2675,prsc:2|A-7933-OUT,B-4420-OUT;n:type:ShaderForge.SFN_Distance,id:3952,x:30715,y:32903,varname:node_3952,prsc:2|A-2675-OUT,B-127-OUT;n:type:ShaderForge.SFN_Vector2,id:127,x:30463,y:33029,varname:node_127,prsc:2,v1:0,v2:0;n:type:ShaderForge.SFN_OneMinus,id:7813,x:30715,y:33029,varname:node_7813,prsc:2|IN-3952-OUT;n:type:ShaderForge.SFN_Clamp01,id:2251,x:30715,y:33156,varname:node_2251,prsc:2|IN-7813-OUT;n:type:ShaderForge.SFN_Relay,id:144,x:31159,y:32826,varname:node_144,prsc:2|IN-9229-OUT;n:type:ShaderForge.SFN_Relay,id:7933,x:30311,y:32835,varname:node_7933,prsc:2|IN-144-OUT;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:3397,x:31100,y:32995,varname:node_3397,prsc:2|IN-2251-OUT,IMIN-504-OUT,IMAX-6367-OUT,OMIN-504-OUT,OMAX-6705-OUT;n:type:ShaderForge.SFN_Multiply,id:6367,x:30923,y:32854,varname:node_6367,prsc:2|A-9707-OUT,B-3422-OUT;n:type:ShaderForge.SFN_Vector1,id:504,x:30876,y:33135,varname:node_504,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:6705,x:30876,y:33190,varname:node_6705,prsc:2,v1:1;n:type:ShaderForge.SFN_Clamp01,id:1844,x:31262,y:32995,varname:node_1844,prsc:2|IN-3397-OUT;n:type:ShaderForge.SFN_Color,id:5708,x:31384,y:32826,ptovrint:False,ptlb:Glow Color,ptin:_GlowColor,varname:node_5708,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:2085,x:31592,y:32899,varname:node_2085,prsc:2|A-5708-A,B-6935-OUT;n:type:ShaderForge.SFN_Subtract,id:9753,x:32549,y:32900,varname:node_9753,prsc:2|A-8970-OUT,B-4309-OUT;n:type:ShaderForge.SFN_Relay,id:3783,x:31613,y:32582,cmnt:Moon Cutout,varname:node_3783,prsc:2|IN-6205-OUT;n:type:ShaderForge.SFN_OneMinus,id:2757,x:31554,y:32649,varname:node_2757,prsc:2|IN-3783-OUT;n:type:ShaderForge.SFN_Multiply,id:4141,x:31554,y:32770,varname:node_4141,prsc:2|A-2757-OUT,B-5708-RGB;n:type:ShaderForge.SFN_Add,id:3328,x:32534,y:32698,varname:node_3328,prsc:2|A-4001-OUT,B-4141-OUT;n:type:ShaderForge.SFN_Add,id:6195,x:32959,y:32924,varname:node_6195,prsc:2|A-4309-OUT,B-4419-OUT;n:type:ShaderForge.SFN_Clamp01,id:8744,x:32549,y:33025,varname:node_8744,prsc:2|IN-9753-OUT;n:type:ShaderForge.SFN_Relay,id:5278,x:32594,y:33165,varname:node_5278,prsc:2|IN-4974-OUT;n:type:ShaderForge.SFN_Multiply,id:4419,x:32971,y:33054,varname:node_4419,prsc:2|A-8744-OUT,B-5278-OUT;n:type:ShaderForge.SFN_Slider,id:3219,x:31935,y:31857,ptovrint:False,ptlb:Glow Off Surface,ptin:_GlowOffSurface,varname:node_3219,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.2;n:type:ShaderForge.SFN_Length,id:3433,x:31733,y:32199,varname:node_3433,prsc:2|IN-1276-OUT;n:type:ShaderForge.SFN_Clamp,id:2212,x:31935,y:31978,varname:node_2212,prsc:2|IN-7037-OUT,MIN-3219-OUT,MAX-1826-OUT;n:type:ShaderForge.SFN_Vector1,id:1826,x:31733,y:31998,varname:node_1826,prsc:2,v1:1;n:type:ShaderForge.SFN_OneMinus,id:5035,x:31262,y:33111,varname:node_5035,prsc:2|IN-1844-OUT;n:type:ShaderForge.SFN_Multiply,id:7455,x:31442,y:33111,varname:node_7455,prsc:2|A-5035-OUT,B-5035-OUT;n:type:ShaderForge.SFN_OneMinus,id:6935,x:31442,y:32995,varname:node_6935,prsc:2|IN-7455-OUT;n:type:ShaderForge.SFN_Relay,id:2768,x:31560,y:32230,varname:node_2768,prsc:2|IN-8547-OUT;n:type:ShaderForge.SFN_Negate,id:9362,x:31501,y:32075,varname:node_9362,prsc:2|IN-2768-OUT;n:type:ShaderForge.SFN_Relay,id:8547,x:30962,y:32227,varname:node_8547,prsc:2|IN-9707-OUT;n:type:ShaderForge.SFN_Multiply,id:4133,x:32218,y:31593,varname:node_4133,prsc:2|A-3357-OUT,B-3357-OUT;n:type:ShaderForge.SFN_Cos,id:5262,x:31120,y:31451,varname:node_5262,prsc:2|IN-3011-OUT;n:type:ShaderForge.SFN_RemapRange,id:2536,x:31323,y:31407,varname:node_2536,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-5262-OUT;n:type:ShaderForge.SFN_Multiply,id:3011,x:30866,y:31533,varname:node_3011,prsc:2|A-3167-OUT,B-4375-OUT;n:type:ShaderForge.SFN_Multiply,id:5430,x:31589,y:31326,varname:node_5430,prsc:2|A-2536-OUT,B-2536-OUT,C-2536-OUT,D-2536-OUT;n:type:ShaderForge.SFN_Relay,id:3154,x:32050,y:31325,varname:node_3154,prsc:2|IN-4033-OUT;n:type:ShaderForge.SFN_Multiply,id:550,x:32542,y:31387,varname:node_550,prsc:2|A-5689-OUT,B-4059-OUT;n:type:ShaderForge.SFN_RemapRange,id:5689,x:32275,y:31325,varname:node_5689,prsc:2,frmn:0,frmx:1,tomn:0.96,tomx:1.2|IN-3154-OUT;n:type:ShaderForge.SFN_Multiply,id:4033,x:31784,y:31304,varname:node_4033,prsc:2|A-5430-OUT,B-5430-OUT;n:type:ShaderForge.SFN_Multiply,id:6955,x:32520,y:32438,varname:node_6955,prsc:2|A-4974-OUT,B-5708-RGB;n:type:ShaderForge.SFN_Clamp01,id:5647,x:32699,y:31387,varname:node_5647,prsc:2|IN-550-OUT;n:type:ShaderForge.SFN_Relay,id:8970,x:32040,y:32941,varname:node_8970,prsc:2|IN-2085-OUT;n:type:ShaderForge.SFN_Multiply,id:2159,x:33006,y:32423,varname:node_2159,prsc:2|A-7393-OUT,B-6955-OUT;n:type:ShaderForge.SFN_Slider,id:7393,x:32757,y:32284,ptovrint:False,ptlb:Glow Multiplier,ptin:_GlowMultiplier,varname:node_7393,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.75,cur:1.134615,max:1.5;proporder:6074-9707-3167-5708-3422-3219-7393;pass:END;sub:END;*/

Shader "Shader Forge/Moon Billboard" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _MoonSize ("Moon Size", Range(0.1, 1)) = 0.5092858
        _MoonPhase ("MoonPhase", Range(0, 1)) = 1
        _GlowColor ("Glow Color", Color) = (0.5,0.5,0.5,1)
        _GlowSize ("Glow Size", Range(0.1, 1)) = 0.7707924
        _GlowOffSurface ("Glow Off Surface", Range(0, 0.2)) = 0
        _GlowMultiplier ("Glow Multiplier", Range(0.75, 1.5)) = 1.134615
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _MoonSize;
            uniform float _MoonPhase;
            uniform float _GlowSize;
            uniform float4 _GlowColor;
            uniform float _GlowOffSurface;
            uniform float _GlowMultiplier;
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
////// Lighting:
////// Emissive:
                float node_4375 = 6.28318530718;
                float node_2536 = (cos((_MoonPhase*node_4375))*0.5+0.5);
                float node_5430 = (node_2536*node_2536*node_2536*node_2536);
                float node_8526 = ((0.25+_MoonPhase)*node_4375);
                float node_1842 = (1.0/_MoonSize);
                float2 node_9229 = (i.uv0*2.0+-1.0);
                float2 node_1276 = (node_1842*node_9229);
                float node_7037 = (1.0 - length(node_1276));
                float node_5298 = (1.0 - dot(float3(cos(node_8526),0.0,sin(node_8526)),normalize(float3(node_1276,clamp(node_7037,_GlowOffSurface,1.0)))));
                float node_7246 = (node_5298*node_5298*node_5298*node_5298);
                float node_3357 = (node_7246*node_7246*node_7246*node_7246);
                float node_4974 = saturate((((node_5430*node_5430)*0.2400001+0.96)*(1.0 - (node_3357*node_3357))));
                float node_6205 = (1.0 - step(node_7037,0.0)); // Moon Cutout
                float2 node_9176 = (((0.5*node_1842)*node_9229)+0.5*float2(1,1));
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_9176, _MainTex));
                float3 emissive = (((_GlowMultiplier*(node_4974*_GlowColor.rgb))*(node_6205*_MainTex_var.rgb))+((1.0 - node_6205)*_GlowColor.rgb));
                float3 finalColor = emissive;
                float node_4309 = (node_6205*_MainTex_var.a);
                float node_504 = 0.0;
                float node_5035 = (1.0 - saturate((node_504 + ( (saturate((1.0 - distance((node_9229*(1.0/_GlowSize)),float2(0,0)))) - node_504) * (1.0 - node_504) ) / ((_MoonSize*_GlowSize) - node_504))));
                return fixed4(finalColor,(node_4309+(saturate(((_GlowColor.a*(1.0 - (node_5035*node_5035)))-node_4309))*node_4974)));
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
