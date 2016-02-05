// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:2,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:True,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:33400,y:32589,varname:node_2865,prsc:2|diff-9190-OUT,gloss-2060-OUT,normal-3134-RGB;n:type:ShaderForge.SFN_Code,id:8399,x:31248,y:32657,varname:node_8399,prsc:2,code:bABvAGMAYQBsAE4AbwByAG0AYQBsACAAPQAgAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAgACoAIABsAG8AYwBhAGwATgBvAHIAbQBhAGwAIAAqACAAbABvAGMAYQBsAE4AbwByAG0AYQBsADsACgBsAG8AYwBhAGwATgBvAHIAbQBhAGwAIAA9ACAAbABvAGMAYQBsAE4AbwByAG0AYQBsAC4AcgBnAGIAIAAvACAAKABsAG8AYwBhAGwATgBvAHIAbQBhAGwALgByACAAKwAgAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAuAGcAIAArACAAbABvAGMAYQBsAE4AbwByAG0AYQBsAC4AYgApADsADQAKAA0ACgBsAG8AYwBhAGwAUABvAHMAaQB0AGkAbwBuACAAPQAgAGwAbwBjAGEAbABQAG8AcwBpAHQAaQBvAG4ALwBzAGMAYQBsAGUAOwANAAoAZgBsAG8AYQB0ADQAIAB0AGUAeAAxACAAPQAgAHQAZQB4ADIARAAoAFQAZQB4ACwAbABvAGMAYQBsAFAAbwBzAGkAdABpAG8AbgAuAHIAZwApADsADQAKAGYAbABvAGEAdAA0ACAAdABlAHgAMgAgAD0AIAB0AGUAeAAyAEQAKABUAGUAeAAsAGwAbwBjAGEAbABQAG8AcwBpAHQAaQBvAG4ALgByAGIAKQA7AA0ACgBmAGwAbwBhAHQANAAgAHQAZQB4ADMAIAA9ACAAdABlAHgAMgBEACgAVABlAHgALABsAG8AYwBhAGwAUABvAHMAaQB0AGkAbwBuAC4AZwBiACkAOwANAAoAZgBsAG8AYQB0ADQAIAB0AGUAeAAxAFIAZQBzAHUAbAB0ACAAPQAgACgAbABvAGMAYQBsAE4AbwByAG0AYQBsAC4AYgAqAHQAZQB4ADEAIAArACAAbABvAGMAYQBsAE4AbwByAG0AYQBsAC4AZwAqAHQAZQB4ADIAIAArACAAbABvAGMAYQBsAE4AbwByAG0AYQBsAC4AcgAqAHQAZQB4ADMAKQAgACoAIABTAHAAbABhAHQAbQBhAHAALgByADsACgAKAAoAdABlAHgAMQAgAD0AIAB0AGUAeAAyAEQAKABUAGUAeAAyACwAbABvAGMAYQBsAFAAbwBzAGkAdABpAG8AbgAuAHIAZwApADsADQAKAHQAZQB4ADIAIAA9ACAAdABlAHgAMgBEACgAVABlAHgAMgAsAGwAbwBjAGEAbABQAG8AcwBpAHQAaQBvAG4ALgByAGIAKQA7AA0ACgB0AGUAeAAzACAAPQAgAHQAZQB4ADIARAAoAFQAZQB4ADIALABsAG8AYwBhAGwAUABvAHMAaQB0AGkAbwBuAC4AZwBiACkAOwANAAoAZgBsAG8AYQB0ADQAIAB0AGUAeAAyAFIAZQBzAHUAbAB0ACAAPQAgACgAbABvAGMAYQBsAE4AbwByAG0AYQBsAC4AYgAqAHQAZQB4ADEAIAArACAAbABvAGMAYQBsAE4AbwByAG0AYQBsAC4AZwAqAHQAZQB4ADIAIAArACAAbABvAGMAYQBsAE4AbwByAG0AYQBsAC4AcgAqAHQAZQB4ADMAKQAgACoAIABTAHQAcgBhAHQAYQAgACoAIABTAHAAbABhAHQAbQBhAHAALgBnADsACgAKAHQAZQB4ADEAIAA9ACAAdABlAHgAMgBEACgAUwBhAG4AZABUAGUAeAAsAGwAbwBjAGEAbABQAG8AcwBpAHQAaQBvAG4ALgByAGcAKQA7AA0ACgB0AGUAeAAyACAAPQAgAHQAZQB4ADIARAAoAFMAYQBuAGQAVABlAHgALABsAG8AYwBhAGwAUABvAHMAaQB0AGkAbwBuAC4AcgBiACkAOwANAAoAdABlAHgAMwAgAD0AIAB0AGUAeAAyAEQAKABTAGEAbgBkAFQAZQB4ACwAbABvAGMAYQBsAFAAbwBzAGkAdABpAG8AbgAuAGcAYgApADsADQAKAGYAbABvAGEAdAA0ACAAcwBhAG4AZABUAGUAeABSAGUAcwB1AGwAdAAgAD0AIAAoAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAuAGIAKgB0AGUAeAAxACAAKwAgAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAuAGcAKgB0AGUAeAAyACAAKwAgAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAuAHIAKgB0AGUAeAAzACkAIAAqACAAUwBwAGwAYQB0AG0AYQBwAC4AYgA7AAoACgBsAG8AYwBhAGwAUABvAHMAaQB0AGkAbwBuACAAPQAgAGwAbwBjAGEAbABQAG8AcwBpAHQAaQBvAG4AIAAqACAAcwBjAGEAbABlACAALwAgAG4AbwBpAHMAZQBTAGMAYQBsAGUAOwAKAGYAbABvAGEAdAAgAG4AbwBpAHMAZQBUAGUAeAAxACAAPQAgAHQAZQB4ADIARAAoAE4AbwBpAHMAZQBUAGUAeAAsAGwAbwBjAGEAbABQAG8AcwBpAHQAaQBvAG4ALgByAGcAKQAuAHIAOwANAAoAZgBsAG8AYQB0ACAAbgBvAGkAcwBlAFQAZQB4ADIAIAA9ACAAdABlAHgAMgBEACgATgBvAGkAcwBlAFQAZQB4ACwAbABvAGMAYQBsAFAAbwBzAGkAdABpAG8AbgAuAHIAYgApAC4AcgA7AA0ACgBmAGwAbwBhAHQAIABuAG8AaQBzAGUAVABlAHgAMwAgAD0AIAB0AGUAeAAyAEQAKABOAG8AaQBzAGUAVABlAHgALABsAG8AYwBhAGwAUABvAHMAaQB0AGkAbwBuAC4AZwBiACkALgByADsADQAKAGYAbABvAGEAdAA0ACAAbgBvAGkAcwBlAFIAZQBzAHUAbAB0ACAAPQAgACgAbABvAGMAYQBsAE4AbwByAG0AYQBsAC4AYgAqAG4AbwBpAHMAZQBUAGUAeAAxACAAKwAgAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAuAGcAKgBuAG8AaQBzAGUAVABlAHgAMgAgACsAIABsAG8AYwBhAGwATgBvAHIAbQBhAGwALgByACoAbgBvAGkAcwBlAFQAZQB4ADMAKQA7AAoADQAKAHIAZQB0AHUAcgBuACAAKAB0AGUAeAAxAFIAZQBzAHUAbAB0ACAAKwAgAHQAZQB4ADIAUgBlAHMAdQBsAHQAIAArACAAcwBhAG4AZABUAGUAeABSAGUAcwB1AGwAdAApACAAKgAgAG4AbwBpAHMAZQBSAGUAcwB1AGwAdAA7AA==,output:3,fname:TPM,width:930,height:411,input:2,input:2,input:0,input:12,input:12,input:0,input:12,input:0,input:12,input:3,input_1_label:localNormal,input_2_label:localPosition,input_3_label:scale,input_4_label:Tex,input_5_label:Tex2,input_6_label:Strata,input_7_label:NoiseTex,input_8_label:noiseScale,input_9_label:SandTex,input_10_label:Splatmap|A-8206-OUT,B-8006-OUT,C-6521-OUT,D-4576-TEX,E-7407-TEX,F-2130-OUT,G-3867-TEX,H-9531-OUT,I-4540-TEX,J-2673-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:9488,x:30002,y:32818,varname:node_9488,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:3310,x:29907,y:32421,prsc:2,pt:False;n:type:ShaderForge.SFN_Abs,id:8126,x:30114,y:32431,varname:node_8126,prsc:2|IN-3310-OUT;n:type:ShaderForge.SFN_Slider,id:6521,x:30334,y:32991,ptovrint:False,ptlb:Scale,ptin:_Scale,varname:_Scale,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:3.858027,max:20;n:type:ShaderForge.SFN_Tex2dAsset,id:4576,x:30715,y:32907,ptovrint:False,ptlb:Low Grass Diffuse,ptin:_LowGrassDiffuse,varname:_GrassDiffuse,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4166611f5efcb604994dd706e715f396,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ComponentMask,id:9190,x:32848,y:32424,varname:node_9190,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-8399-OUT;n:type:ShaderForge.SFN_ComponentMask,id:2060,x:32846,y:32687,varname:node_2060,prsc:2,cc1:3,cc2:-1,cc3:-1,cc4:-1|IN-8399-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:7407,x:30714,y:33088,ptovrint:False,ptlb:Rock Diffuse,ptin:_RockDiffuse,varname:_RockDiffuse,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:24b825f299d3a934fa4a7ff70c2f04bf,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Relay,id:8206,x:30547,y:32653,cmnt:Normal,varname:node_8206,prsc:2|IN-8126-OUT;n:type:ShaderForge.SFN_Relay,id:8006,x:30715,y:32840,cmnt:Position,varname:node_8006,prsc:2|IN-9488-XYZ;n:type:ShaderForge.SFN_Append,id:8972,x:29966,y:33217,varname:node_8972,prsc:2|A-1541-OUT,B-9541-OUT;n:type:ShaderForge.SFN_Multiply,id:9541,x:29700,y:32956,varname:node_9541,prsc:2|A-9488-Y,B-7477-OUT,C-5560-OUT;n:type:ShaderForge.SFN_Slider,id:7477,x:28924,y:32994,ptovrint:False,ptlb:Strata Vertical Scale,ptin:_StrataVerticalScale,varname:_StrataVerticalScale,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.025,cur:1,max:1;n:type:ShaderForge.SFN_Tex2d,id:8918,x:30221,y:33178,ptovrint:False,ptlb:Strata Gradient,ptin:_StrataGradient,varname:_StrataGradient,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:907a460eb7f17684ca64ef64cec2197d,ntxv:0,isnm:False|UVIN-8972-OUT;n:type:ShaderForge.SFN_Slider,id:1530,x:30076,y:33447,ptovrint:False,ptlb:Strata Amount,ptin:_StrataAmount,varname:_StrataAmount,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2141035,max:1;n:type:ShaderForge.SFN_Vector1,id:5560,x:29413,y:33054,varname:node_5560,prsc:2,v1:0.05;n:type:ShaderForge.SFN_Multiply,id:1541,x:29648,y:33216,varname:node_1541,prsc:2|A-3695-OUT,B-8248-OUT;n:type:ShaderForge.SFN_Slider,id:3695,x:29054,y:33143,ptovrint:False,ptlb:Strata Horizontal Scale,ptin:_StrataHorizontalScale,varname:_StrataHorizontalScale,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.001,cur:4.359539,max:10;n:type:ShaderForge.SFN_Lerp,id:2130,x:30519,y:33213,varname:node_2130,prsc:2|A-8733-OUT,B-8918-RGB,T-1530-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:3867,x:30509,y:32293,ptovrint:False,ptlb:Diffuse Noise,ptin:_DiffuseNoise,varname:_DiffuseNoise,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b8ea00fcfa6ae004d84e7621154550da,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:9531,x:30402,y:32505,ptovrint:False,ptlb:Diffuse Noise Scale,ptin:_DiffuseNoiseScale,varname:_DiffuseNoiseScale,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.01,cur:1,max:50;n:type:ShaderForge.SFN_Tex2dAsset,id:4540,x:30894,y:33132,ptovrint:False,ptlb:High Grass Diffuse,ptin:_HighGrassDiffuse,varname:_SandDiffuse,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6cb300711d3ad324283b58a4a3a6ed9e,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2452,x:30905,y:32417,ptovrint:False,ptlb:SplatMap,ptin:_SplatMap,varname:_Splatmap,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a4a297868888ae043b48e325c6b575da,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Append,id:2673,x:31108,y:32417,varname:node_2673,prsc:2|A-2452-RGB,B-2452-A;n:type:ShaderForge.SFN_TexCoord,id:7412,x:29060,y:33362,varname:node_7412,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:8248,x:29313,y:33328,varname:node_8248,prsc:2|A-7412-U,B-7412-V;n:type:ShaderForge.SFN_Tex2d,id:3134,x:33024,y:32920,ptovrint:False,ptlb:Noise Normal,ptin:_NoiseNormal,varname:node_3134,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:da8b7819c728ca145bb3b1c5710936f6,ntxv:3,isnm:True|UVIN-8228-OUT;n:type:ShaderForge.SFN_TexCoord,id:5430,x:32581,y:32884,varname:node_5430,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:8228,x:32811,y:32920,varname:node_8228,prsc:2|A-5430-UVOUT,B-5924-OUT;n:type:ShaderForge.SFN_Slider,id:5924,x:32424,y:33084,ptovrint:False,ptlb:Noise Normal Scale,ptin:_NoiseNormalScale,varname:node_5924,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:4.102564,max:10;n:type:ShaderForge.SFN_Vector1,id:8733,x:30221,y:33074,varname:node_8733,prsc:2,v1:1;proporder:6521-4576-7407-4540-8918-1530-7477-3695-3867-9531-2452-3134-5924;pass:END;sub:END;*/

Shader "TMX/Terrain Splatmap Edit" {
    Properties {
        _Scale ("Scale", Range(0, 20)) = 3.858027
        _LowGrassDiffuse ("Low Grass Diffuse", 2D) = "white" {}
        _RockDiffuse ("Rock Diffuse", 2D) = "white" {}
        _HighGrassDiffuse ("High Grass Diffuse", 2D) = "white" {}
        _StrataGradient ("Strata Gradient", 2D) = "white" {}
        _StrataAmount ("Strata Amount", Range(0, 1)) = 0.2141035
        _StrataVerticalScale ("Strata Vertical Scale", Range(0.025, 1)) = 1
        _StrataHorizontalScale ("Strata Horizontal Scale", Range(0.001, 10)) = 4.359539
        _DiffuseNoise ("Diffuse Noise", 2D) = "white" {}
        _DiffuseNoiseScale ("Diffuse Noise Scale", Range(0.01, 50)) = 1
        _SplatMap ("SplatMap", 2D) = "white" {}
        _NoiseNormal ("Noise Normal", 2D) = "bump" {}
        _NoiseNormalScale ("Noise Normal Scale", Range(0, 10)) = 4.102564
        _WorldScale ("World Scale", Vector) = (300,0,300,0)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
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
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            float4 TPM( float3 localNormal , float3 localPosition , float scale , sampler2D Tex , sampler2D Tex2 , float Strata , sampler2D NoiseTex , float noiseScale , sampler2D SandTex , float4 Splatmap ){
            localNormal = localNormal * localNormal * localNormal;
            localNormal = localNormal.rgb / (localNormal.r + localNormal.g + localNormal.b);
            
            localPosition = localPosition/scale;
            float4 tex1 = tex2D(Tex,localPosition.rg);
            float4 tex2 = tex2D(Tex,localPosition.rb);
            float4 tex3 = tex2D(Tex,localPosition.gb);
            float4 tex1Result = (localNormal.b*tex1 + localNormal.g*tex2 + localNormal.r*tex3) * Splatmap.r;
            
            
            tex1 = tex2D(Tex2,localPosition.rg);
            tex2 = tex2D(Tex2,localPosition.rb);
            tex3 = tex2D(Tex2,localPosition.gb);
            float4 tex2Result = (localNormal.b*tex1 + localNormal.g*tex2 + localNormal.r*tex3) * Strata * Splatmap.g;
            
            tex1 = tex2D(SandTex,localPosition.rg);
            tex2 = tex2D(SandTex,localPosition.rb);
            tex3 = tex2D(SandTex,localPosition.gb);
            float4 sandTexResult = (localNormal.b*tex1 + localNormal.g*tex2 + localNormal.r*tex3) * Splatmap.b;
            
            localPosition = localPosition * scale / noiseScale;
            float noiseTex1 = tex2D(NoiseTex,localPosition.rg).r;
            float noiseTex2 = tex2D(NoiseTex,localPosition.rb).r;
            float noiseTex3 = tex2D(NoiseTex,localPosition.gb).r;
            float4 noiseResult = (localNormal.b*noiseTex1 + localNormal.g*noiseTex2 + localNormal.r*noiseTex3);
            
            return (tex1Result + tex2Result + sandTexResult) * noiseResult;
            }
            
            uniform float _Scale;
            uniform sampler2D _LowGrassDiffuse; uniform float4 _LowGrassDiffuse_ST;
            uniform sampler2D _RockDiffuse; uniform float4 _RockDiffuse_ST;
            uniform float _StrataVerticalScale;
            uniform sampler2D _StrataGradient; uniform float4 _StrataGradient_ST;
            uniform float _StrataAmount;
            uniform float _StrataHorizontalScale;
            uniform sampler2D _DiffuseNoise; uniform float4 _DiffuseNoise_ST;
            uniform float _DiffuseNoiseScale;
            uniform sampler2D _HighGrassDiffuse; uniform float4 _HighGrassDiffuse_ST;
            uniform sampler2D _SplatMap; uniform float4 _SplatMap_ST;
            uniform sampler2D _NoiseNormal; uniform float4 _NoiseNormal_ST;
            uniform float _NoiseNormalScale;
            uniform float4 _WorldScale;
            
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float2 node_8228 = (i.uv0*_NoiseNormalScale);
                float3 _NoiseNormal_var = UnpackNormal(tex2D(_NoiseNormal,TRANSFORM_TEX(node_8228, _NoiseNormal)));
                float3 normalLocal = _NoiseNormal_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float node_8733 = 1.0;
                float2 node_8972 = float2((_StrataHorizontalScale*(i.uv0.r+i.uv0.g)),(i.posWorld.g*_StrataVerticalScale*0.05));
                float4 _StrataGradient_var = tex2D(_StrataGradient,TRANSFORM_TEX(node_8972, _StrataGradient));
                //splatmap stuff
                float node_5937 = (-1*_WorldScale.r);
                float node_2017 = 0.0;
                float node_7715 = 1.0;
                float node_4408 = (-1*_WorldScale.b);
                float2 node_3574 = float2((node_2017 + ( (i.posWorld.r - node_5937) * (node_7715 - node_2017) ) / (_WorldScale.r - node_5937)),(node_2017 + ( (i.posWorld.b - node_4408) * (node_7715 - node_2017) ) / (_WorldScale.b - node_4408)));
                float4 _SplatMap_var = tex2D(_SplatMap,TRANSFORM_TEX(node_3574, _SplatMap));
                float4 node_8399 = TPM( abs(i.normalDir) , i.posWorld.rgb , _Scale , _LowGrassDiffuse , _RockDiffuse , lerp(float3(node_8733,node_8733,node_8733),_StrataGradient_var.rgb,_StrataAmount).r , _DiffuseNoise , _DiffuseNoiseScale , _HighGrassDiffuse , float4(_SplatMap_var.rgb,_SplatMap_var.a) );
                float3 diffuseColor = node_8399.rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,1);
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
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            float4 TPM( float3 localNormal , float3 localPosition , float scale , sampler2D Tex , sampler2D Tex2 , float Strata , sampler2D NoiseTex , float noiseScale , sampler2D SandTex , float4 Splatmap ){
            localNormal = localNormal * localNormal * localNormal;
            localNormal = localNormal.rgb / (localNormal.r + localNormal.g + localNormal.b);
            
            localPosition = localPosition/scale;
            float4 tex1 = tex2D(Tex,localPosition.rg);
            float4 tex2 = tex2D(Tex,localPosition.rb);
            float4 tex3 = tex2D(Tex,localPosition.gb);
            float4 tex1Result = (localNormal.b*tex1 + localNormal.g*tex2 + localNormal.r*tex3) * Splatmap.r;
            
            
            tex1 = tex2D(Tex2,localPosition.rg);
            tex2 = tex2D(Tex2,localPosition.rb);
            tex3 = tex2D(Tex2,localPosition.gb);
            float4 tex2Result = (localNormal.b*tex1 + localNormal.g*tex2 + localNormal.r*tex3) * Strata * Splatmap.g;
            
            tex1 = tex2D(SandTex,localPosition.rg);
            tex2 = tex2D(SandTex,localPosition.rb);
            tex3 = tex2D(SandTex,localPosition.gb);
            float4 sandTexResult = (localNormal.b*tex1 + localNormal.g*tex2 + localNormal.r*tex3) * Splatmap.b;
            
            localPosition = localPosition * scale / noiseScale;
            float noiseTex1 = tex2D(NoiseTex,localPosition.rg).r;
            float noiseTex2 = tex2D(NoiseTex,localPosition.rb).r;
            float noiseTex3 = tex2D(NoiseTex,localPosition.gb).r;
            float4 noiseResult = (localNormal.b*noiseTex1 + localNormal.g*noiseTex2 + localNormal.r*noiseTex3);
            
            return (tex1Result + tex2Result + sandTexResult) * noiseResult;
            }
            
            uniform float _Scale;
            uniform sampler2D _LowGrassDiffuse; uniform float4 _LowGrassDiffuse_ST;
            uniform sampler2D _RockDiffuse; uniform float4 _RockDiffuse_ST;
            uniform float _StrataVerticalScale;
            uniform sampler2D _StrataGradient; uniform float4 _StrataGradient_ST;
            uniform float _StrataAmount;
            uniform float _StrataHorizontalScale;
            uniform sampler2D _DiffuseNoise; uniform float4 _DiffuseNoise_ST;
            uniform float _DiffuseNoiseScale;
            uniform sampler2D _HighGrassDiffuse; uniform float4 _HighGrassDiffuse_ST;
            uniform sampler2D _SplatMap; uniform float4 _SplatMap_ST;
            uniform sampler2D _NoiseNormal; uniform float4 _NoiseNormal_ST;
            uniform float _NoiseNormalScale;
            uniform float4 _WorldScale;
            
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float2 node_8228 = (i.uv0*_NoiseNormalScale);
                float3 _NoiseNormal_var = UnpackNormal(tex2D(_NoiseNormal,TRANSFORM_TEX(node_8228, _NoiseNormal)));
                float3 normalLocal = _NoiseNormal_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float node_8733 = 1.0;
                float2 node_8972 = float2((_StrataHorizontalScale*(i.uv0.r+i.uv0.g)),(i.posWorld.g*_StrataVerticalScale*0.05));
                float4 _StrataGradient_var = tex2D(_StrataGradient,TRANSFORM_TEX(node_8972, _StrataGradient));
                float4 _SplatMap_var = tex2D(_SplatMap,TRANSFORM_TEX(i.uv0, _SplatMap));
                float4 node_8399 = TPM( abs(i.normalDir) , i.posWorld.rgb , _Scale , _LowGrassDiffuse , _RockDiffuse , lerp(float3(node_8733,node_8733,node_8733),_StrataGradient_var.rgb,_StrataAmount).r , _DiffuseNoise , _DiffuseNoiseScale , _HighGrassDiffuse , float4(_SplatMap_var.rgb,_SplatMap_var.a) );
                float3 diffuseColor = node_8399.rgb;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
