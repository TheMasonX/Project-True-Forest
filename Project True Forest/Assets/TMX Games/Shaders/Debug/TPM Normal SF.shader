// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:1,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:32719,y:32712,varname:node_2865,prsc:2|diff-8755-OUT,spec-3374-OUT,gloss-9100-OUT,normal-4041-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:2910,x:31028,y:33089,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:_Normal,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ab819437bc5776948ac0e1bb58701c49,ntxv:3,isnm:True;n:type:ShaderForge.SFN_FragmentPosition,id:6180,x:30995,y:32922,varname:node_6180,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:1204,x:30934,y:32717,prsc:2,pt:False;n:type:ShaderForge.SFN_Slider,id:2944,x:30860,y:33280,ptovrint:False,ptlb:Scale,ptin:_Scale,varname:_Scale,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.1,cur:4.415735,max:20;n:type:ShaderForge.SFN_Code,id:3108,x:31191,y:32468,varname:node_3108,prsc:2,code:bABvAGMAYQBsAE4AbwByAG0AYQBsACAAKgA9ACAAbABvAGMAYQBsAE4AbwByAG0AYQBsACAAKgAgAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAgACoAIABsAG8AYwBhAGwATgBvAHIAbQBhAGwAOwANAAoAbABvAGMAYQBsAE4AbwByAG0AYQBsACAAPQAgAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAuAHIAZwBiACAALwAgACgAbABvAGMAYQBsAE4AbwByAG0AYQBsAC4AcgAgACsAIABsAG8AYwBhAGwATgBvAHIAbQBhAGwALgBnACAAKwAgAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAuAGIAKQA7AA0ACgANAAoAbABvAGMAYQBsAFAAbwBzAGkAdABpAG8AbgAgAD0AIABsAG8AYwBhAGwAUABvAHMAaQB0AGkAbwBuAC8AcwBjAGEAbABlADsADQAKAGYAbABvAGEAdAAzACAAdABlAHgAMQAgAD0AIAB0AGUAeAAyAEQAKAB0AGUAeAAsAGwAbwBjAGEAbABQAG8AcwBpAHQAaQBvAG4ALgByAGcAKQA7AA0ACgBmAGwAbwBhAHQAMwAgAHQAZQB4ADIAIAA9ACAAdABlAHgAMgBEACgAdABlAHgALABsAG8AYwBhAGwAUABvAHMAaQB0AGkAbwBuAC4AcgBiACkAOwANAAoALwAvAHQAZQB4ADIAIAA9ACAAZgBsAG8AYQB0ADMAKAB0AGUAeAAyAC4AZwAsACAAdABlAHgAMgAuAGIALAAgAHQAZQB4ADIALgByACkAOwANAAoAZgBsAG8AYQB0ADMAIAB0AGUAeAAzACAAPQAgAHQAZQB4ADIARAAoAHQAZQB4ACwAbABvAGMAYQBsAFAAbwBzAGkAdABpAG8AbgAuAGcAYgApADsADQAKAC8ALwB0AGUAeAAzACAAPQAgAGYAbABvAGEAdAAzACgAdABlAHgAMwAuAGIALAAgAHQAZQB4ADMALgByACwAIAB0AGUAeAAzAC4AZwApADsADQAKAGYAbABvAGEAdAAzACAAbgBvAHIAbQBhAGwAUgBlAHMAdQBsAHQAIAA9ACAAKAB0AGUAeAAxACAAKgAgAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAuAGIAIAArACAAdABlAHgAMgAgACoAIABsAG8AYwBhAGwATgBvAHIAbQBhAGwALgBnACAAKwAgAHQAZQB4ADMAIAAqACAAbABvAGMAYQBsAE4AbwByAG0AYQBsAC4AcgApADsADQAKAA0ACgByAGUAdAB1AHIAbgAgAG4AbwByAG0AYQBsAFIAZQBzAHUAbAB0ADsA,output:2,fname:TPM,width:751,height:305,input:2,input:2,input:12,input:0,input_1_label:localNormal,input_2_label:localPosition,input_3_label:tex,input_4_label:scale|A-1204-OUT,B-6180-XYZ,C-6804-TEX,D-2944-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:6804,x:30870,y:32376,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:_Diffuse,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:24b825f299d3a934fa4a7ff70c2f04bf,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:3374,x:32234,y:32664,ptovrint:False,ptlb:Metal,ptin:_Metal,varname:_Metal,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:9100,x:32234,y:32786,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:_Gloss,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Code,id:4041,x:31231,y:32820,varname:node_4041,prsc:2,code:ZgBsAG8AYQB0ADMAIABhAGIAcwBOAG8AcgBtACAAPQAgAGEAYgBzACgAbgBvAHIAbQBhAGwAKQA7AA0ACgBmAGwAbwBhAHQAIAByACAAPQAgAGEAYgBzAE4AbwByAG0ALgByADsADQAKAGYAbABvAGEAdAAgAGcAIAA9ACAAYQBiAHMATgBvAHIAbQAuAGcAOwANAAoAZgBsAG8AYQB0ACAAYgAgAD0AIABhAGIAcwBOAG8AcgBtAC4AYgA7AA0ACgANAAoAZgBsAG8AYQB0ADMAIABuAG8AcgBtADEAIAA9ACAAZgBsAG8AYQB0ADMAKAAtAGcALAAgAHIALAAgAGIAKQA7AA0ACgBmAGwAbwBhAHQAMwAgAG4AbwByAG0AMgAgAD0AIABmAGwAbwBhAHQAMwAoAC0AYgAsACAAZwAsACAAcgApADsADQAKAA0ACgBmAGwAbwBhAHQAMwAgAG4AbwByAG0AMwAgAD0AIABmAGwAbwBhAHQAMwAoAGcALAAgAC0AcgAsACAAYgApADsADQAKAGYAbABvAGEAdAAzACAAbgBvAHIAbQA0ACAAPQAgAGYAbABvAGEAdAAzACgAcgAsACAALQBiACwAIABnACkAOwANAAoADQAKAGYAbABvAGEAdAAzACAAbgBvAHIAbQA1ACAAPQAgAGYAbABvAGEAdAAzACgAYgAsACAAZwAsACAALQByACkAOwANAAoAZgBsAG8AYQB0ADMAIABuAG8AcgBtADYAIAA9ACAAZgBsAG8AYQB0ADMAKAByACwAIABiACwAIAAtAGcAKQA7AA0ACgANAAoAcABvAHMAaQB0AGkAbwBuACAAPQAgAHAAbwBzAGkAdABpAG8AbgAgAC8AIABzAGMAYQBsAGUAOwANAAoAZgBsAG8AYQB0ADMAIAB0AGUAeAAxACAAPQAgAFUAbgBwAGEAYwBrAE4AbwByAG0AYQBsACgAdABlAHgAMgBEACgAdABlAHgALAAgAHAAbwBzAGkAdABpAG8AbgAuAGcAYgApACkAOwANAAoAZgBsAG8AYQB0ADMAIABjAGgAYQBuAG4AZQBsAEIAbABlAG4AZAAxACAAPQAgAHQAZQB4ADEALgByACAAKgAgAG4AbwByAG0AMQAgACsAIAB0AGUAeAAxAC4AZwAgACoAIABuAG8AcgBtADIAIAArACAAdABlAHgAMQAuAGIAIAAqACAAbgBvAHIAbQBhAGwAOwANAAoAZgBsAG8AYQB0ADMAIAB0AGUAeAAyACAAPQAgAFUAbgBwAGEAYwBrAE4AbwByAG0AYQBsACgAdABlAHgAMgBEACgAdABlAHgALAAgAHAAbwBzAGkAdABpAG8AbgAuAHIAYgApACkAOwANAAoAZgBsAG8AYQB0ADMAIABjAGgAYQBuAG4AZQBsAEIAbABlAG4AZAAyACAAPQAgAHQAZQB4ADIALgByACAAKgAgAG4AbwByAG0AMwAgACsAIAB0AGUAeAAyAC4AZwAgACoAIABuAG8AcgBtADQAIAArACAAdABlAHgAMgAuAGIAIAAqACAAbgBvAHIAbQBhAGwAOwANAAoAZgBsAG8AYQB0ADMAIAB0AGUAeAAzACAAPQAgAFUAbgBwAGEAYwBrAE4AbwByAG0AYQBsACgAdABlAHgAMgBEACgAdABlAHgALAAgAHAAbwBzAGkAdABpAG8AbgAuAHIAZwApACkAOwANAAoAZgBsAG8AYQB0ADMAIABjAGgAYQBuAG4AZQBsAEIAbABlAG4AZAAzACAAPQAgAHQAZQB4ADMALgByACAAKgAgAG4AbwByAG0ANQAgACsAIAB0AGUAeAAzAC4AZwAgACoAIABuAG8AcgBtADYAIAArACAAdABlAHgAMwAuAGIAIAAqACAAbgBvAHIAbQBhAGwAOwANAAoADQAKAG4AbwByAG0AYQBsACAAKgA9ACAAbgBvAHIAbQBhAGwAOwANAAoADQAKAHIAZQB0AHUAcgBuACAAKABjAGgAYQBuAG4AZQBsAEIAbABlAG4AZAAxACAAKgAgAG4AbwByAG0AYQBsAC4AcgAgACsAIABjAGgAYQBuAG4AZQBsAEIAbABlAG4AZAAyACAAKgAgAG4AbwByAG0AYQBsAC4AZwAgACsAIABjAGgAYQBuAG4AZQBsAEIAbABlAG4AZAAzACAAKgAgAG4AbwByAG0AYQBsAC4AYgApADsA,output:2,fname:TPMNormal,width:840,height:388,input:2,input:2,input:0,input:12,input_1_label:normal,input_2_label:position,input_3_label:scale,input_4_label:tex|A-1204-OUT,B-6180-XYZ,C-2944-OUT,D-2910-TEX;n:type:ShaderForge.SFN_Fresnel,id:2806,x:32877,y:32466,varname:node_2806,prsc:2;n:type:ShaderForge.SFN_Vector1,id:8755,x:32555,y:32595,varname:node_8755,prsc:2,v1:1;proporder:6804-2910-2944-3374-9100;pass:END;sub:END;*/

Shader "Shader Forge/TPM Normal SF" {
    Properties {
        _Diffuse ("Diffuse", 2D) = "white" {}
        _Normal ("Normal", 2D) = "bump" {}
        _Scale ("Scale", Range(0.1, 20)) = 4.415735
        _Metal ("Metal", Range(0, 1)) = 0
        _Gloss ("Gloss", Range(0, 1)) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "DEFERRED"
            Tags {
                "LightMode"="Deferred"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_DEFERRED
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile ___ UNITY_HDR_ON
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _Scale;
            uniform float _Metal;
            uniform float _Gloss;
            float3 TPMNormal( float3 normal , float3 position , float scale , sampler2D tex ){
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
            
            position = position / scale;
            float3 tex1 = UnpackNormal(tex2D(tex, position.gb));
            float3 channelBlend1 = tex1.r * norm1 + tex1.g * norm2 + tex1.b * normal;
            float3 tex2 = UnpackNormal(tex2D(tex, position.rb));
            float3 channelBlend2 = tex2.r * norm3 + tex2.g * norm4 + tex2.b * normal;
            float3 tex3 = UnpackNormal(tex2D(tex, position.rg));
            float3 channelBlend3 = tex3.r * norm5 + tex3.g * norm6 + tex3.b * normal;
            
            normal *= normal;
            
            return (channelBlend1 * normal.r + channelBlend2 * normal.g + channelBlend3 * normal.b);
            }
            
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv1 : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float3 tangentDir : TEXCOORD4;
                float3 bitangentDir : TEXCOORD5;
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD6;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            void frag(
                VertexOutput i,
                out half4 outDiffuse : SV_Target0,
                out half4 outSpecSmoothness : SV_Target1,
                out half4 outNormal : SV_Target2,
                out half4 outEmission : SV_Target3 )
            {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalLocal = TPMNormal( i.normalDir , i.posWorld.rgb , _Scale , _Normal );
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
////// Lighting:
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
/////// GI Data:
                UnityLight light; // Dummy light
                light.color = 0;
                light.dir = half3(0,1,0);
                light.ndotl = max(0,dot(normalDirection,light.dir));
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = 1;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                d.boxMax[0] = unity_SpecCube0_BoxMax;
                d.boxMin[0] = unity_SpecCube0_BoxMin;
                d.probePosition[0] = unity_SpecCube0_ProbePosition;
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.boxMax[1] = unity_SpecCube1_BoxMax;
                d.boxMin[1] = unity_SpecCube1_BoxMin;
                d.probePosition[1] = unity_SpecCube1_ProbePosition;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
////// Specular:
                float node_8755 = 1.0;
                float3 diffuseColor = float3(node_8755,node_8755,node_8755); // Need this for specular when using metallic
                float specularMonochrome;
                float3 specularColor;
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, _Metal, specularColor, specularMonochrome );
                specularMonochrome = 1-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular);
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
/////// Diffuse:
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
/// Final Color:
                outDiffuse = half4( diffuseColor, 1 );
                outSpecSmoothness = half4( specularColor, gloss );
                outNormal = half4( normalDirection * 0.5 + 0.5, 1 );
                outEmission = half4(0,0,0,1);
                outEmission.rgb += indirectSpecular * 1;
                outEmission.rgb += indirectDiffuse * diffuseColor;
                #ifndef UNITY_HDR_ON
                    outEmission.rgb = exp2(-outEmission.rgb);
                #endif
            }
            ENDCG
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
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _Scale;
            uniform float _Metal;
            uniform float _Gloss;
            float3 TPMNormal( float3 normal , float3 position , float scale , sampler2D tex ){
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
            
            position = position / scale;
            float3 tex1 = UnpackNormal(tex2D(tex, position.gb));
            float3 channelBlend1 = tex1.r * norm1 + tex1.g * norm2 + tex1.b * normal;
            float3 tex2 = UnpackNormal(tex2D(tex, position.rb));
            float3 channelBlend2 = tex2.r * norm3 + tex2.g * norm4 + tex2.b * normal;
            float3 tex3 = UnpackNormal(tex2D(tex, position.rg));
            float3 channelBlend3 = tex3.r * norm5 + tex3.g * norm6 + tex3.b * normal;
            
            normal *= normal;
            
            return (channelBlend1 * normal.r + channelBlend2 * normal.g + channelBlend3 * normal.b);
            }
            
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv1 : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float3 tangentDir : TEXCOORD4;
                float3 bitangentDir : TEXCOORD5;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD9;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
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
                float3 normalLocal = TPMNormal( i.normalDir , i.posWorld.rgb , _Scale , _Normal );
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
                d.boxMax[0] = unity_SpecCube0_BoxMax;
                d.boxMin[0] = unity_SpecCube0_BoxMin;
                d.probePosition[0] = unity_SpecCube0_ProbePosition;
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.boxMax[1] = unity_SpecCube1_BoxMax;
                d.boxMin[1] = unity_SpecCube1_BoxMin;
                d.probePosition[1] = unity_SpecCube1_ProbePosition;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float node_8755 = 1.0;
                float3 diffuseColor = float3(node_8755,node_8755,node_8755); // Need this for specular when using metallic
                float specularMonochrome;
                float3 specularColor;
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, _Metal, specularColor, specularMonochrome );
                specularMonochrome = 1-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithBeckmannVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, NDFBlinnPhongNormalizedTerm(NdotH, RoughnessToSpecPower(1.0-gloss)));
                float specularPBL = max(0, (NdotL*visTerm*normTerm) * (UNITY_PI / 4) );
                float3 directSpecular = 1 * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularPBL*lightColor*FresnelTerm(specularColor, LdotH);
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular);
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float3 directDiffuse = ((1 +(fd90 - 1)*pow((1.00001-NdotL), 5)) * (1 + (fd90 - 1)*pow((1.00001-NdotV), 5)) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
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
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _Scale;
            uniform float _Metal;
            uniform float _Gloss;
            float3 TPMNormal( float3 normal , float3 position , float scale , sampler2D tex ){
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
            
            position = position / scale;
            float3 tex1 = UnpackNormal(tex2D(tex, position.gb));
            float3 channelBlend1 = tex1.r * norm1 + tex1.g * norm2 + tex1.b * normal;
            float3 tex2 = UnpackNormal(tex2D(tex, position.rb));
            float3 channelBlend2 = tex2.r * norm3 + tex2.g * norm4 + tex2.b * normal;
            float3 tex3 = UnpackNormal(tex2D(tex, position.rg));
            float3 channelBlend3 = tex3.r * norm5 + tex3.g * norm6 + tex3.b * normal;
            
            normal *= normal;
            
            return (channelBlend1 * normal.r + channelBlend2 * normal.g + channelBlend3 * normal.b);
            }
            
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv1 : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
                float3 tangentDir : TEXCOORD4;
                float3 bitangentDir : TEXCOORD5;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
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
                float3 normalLocal = TPMNormal( i.normalDir , i.posWorld.rgb , _Scale , _Normal );
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float node_8755 = 1.0;
                float3 diffuseColor = float3(node_8755,node_8755,node_8755); // Need this for specular when using metallic
                float specularMonochrome;
                float3 specularColor;
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, _Metal, specularColor, specularMonochrome );
                specularMonochrome = 1-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithBeckmannVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, NDFBlinnPhongNormalizedTerm(NdotH, RoughnessToSpecPower(1.0-gloss)));
                float specularPBL = max(0, (NdotL*visTerm*normTerm) * (UNITY_PI / 4) );
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularPBL*lightColor*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float3 directDiffuse = ((1 +(fd90 - 1)*pow((1.00001-NdotL), 5)) * (1 + (fd90 - 1)*pow((1.00001-NdotV), 5)) * NdotL) * attenColor;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "Meta"
            Tags {
                "LightMode"="Meta"
            }
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_META 1
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #include "UnityMetaPass.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float _Metal;
            uniform float _Gloss;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv1 : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                o.Emission = 0;
                
                float node_8755 = 1.0;
                float3 diffColor = float3(node_8755,node_8755,node_8755);
                float specularMonochrome;
                float3 specColor;
                diffColor = DiffuseAndSpecularFromMetallic( diffColor, _Metal, specColor, specularMonochrome );
                float roughness = 1.0 - _Gloss;
                o.Albedo = diffColor + specColor * roughness * roughness * 0.5;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
