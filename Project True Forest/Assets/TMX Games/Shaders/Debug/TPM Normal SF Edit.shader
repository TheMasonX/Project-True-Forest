// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:32719,y:32712,varname:node_2865,prsc:2|diff-3108-OUT,spec-358-OUT,gloss-1813-OUT,normal-6948-OUT;n:type:ShaderForge.SFN_Slider,id:358,x:32250,y:32780,ptovrint:False,ptlb:Metallic,ptin:_Metallic,varname:node_358,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:1813,x:32250,y:32882,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:_Metallic_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.8,max:1;n:type:ShaderForge.SFN_Color,id:1990,x:32285,y:32445,ptovrint:False,ptlb:node_1990,ptin:_node_1990,varname:node_1990,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2dAsset,id:2910,x:31028,y:33089,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:node_2910,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:0a2326416847b0144b84a9af7474a69f,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Code,id:6948,x:31284,y:32980,varname:node_6948,prsc:2,code:bABvAGMAYQBsAE4AbwByAG0AYQBsACAAKgA9ACAAbABvAGMAYQBsAE4AbwByAG0AYQBsACAAKgAgAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAgACoAIABsAG8AYwBhAGwATgBvAHIAbQBhAGwAOwANAAoAbABvAGMAYQBsAE4AbwByAG0AYQBsACAAPQAgAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAuAHIAZwBiACAALwAgACgAbABvAGMAYQBsAE4AbwByAG0AYQBsAC4AcgAgACsAIABsAG8AYwBhAGwATgBvAHIAbQBhAGwALgBnACAAKwAgAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAuAGIAKQA7AA0ACgANAAoAbABvAGMAYQBsAFAAbwBzAGkAdABpAG8AbgAgAD0AIABsAG8AYwBhAGwAUABvAHMAaQB0AGkAbwBuAC8AcwBjAGEAbABlADsADQAKAGYAbABvAGEAdAAzACAAdABlAHgAMQAgAD0AIAB0AGUAeAAyAEQAKABuAG8AcgBtAFQAZQB4ACwAbABvAGMAYQBsAFAAbwBzAGkAdABpAG8AbgAuAHIAZwApADsADQAKAGYAbABvAGEAdAAzACAAdABlAHgAMgAgAD0AIAB0AGUAeAAyAEQAKABuAG8AcgBtAFQAZQB4ACwAbABvAGMAYQBsAFAAbwBzAGkAdABpAG8AbgAuAHIAYgApADsADQAKAHQAZQB4ADIAIAA9ACAAZgBsAG8AYQB0ADMAKAB0AGUAeAAyAC4AZwAsACAAdABlAHgAMgAuAGIALAAgAHQAZQB4ADIALgByACkAOwANAAoAZgBsAG8AYQB0ADMAIAB0AGUAeAAzACAAPQAgAHQAZQB4ADIARAAoAG4AbwByAG0AVABlAHgALABsAG8AYwBhAGwAUABvAHMAaQB0AGkAbwBuAC4AZwBiACkAOwANAAoAdABlAHgAMwAgAD0AIABmAGwAbwBhAHQAMwAoAHQAZQB4ADMALgBiACwAIAB0AGUAeAAzAC4AcgAsACAAdABlAHgAMwAuAGcAKQA7AA0ACgBmAGwAbwBhAHQAMwAgAG4AbwByAG0AYQBsAFIAZQBzAHUAbAB0ACAAPQAgACgAdABlAHgAMQAgACoAIABsAG8AYwBhAGwATgBvAHIAbQBhAGwALgBiACAAKwAgAHQAZQB4ADIAIAAqACAAbABvAGMAYQBsAE4AbwByAG0AYQBsAC4AZwAgACsAIAB0AGUAeAAzACAAKgAgAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAuAHIAKQA7AA0ACgANAAoAcgBlAHQAdQByAG4AIABuAG8AcgBtAGEAbABSAGUAcwB1AGwAdAA7AA==,output:2,fname:TPMNormal,width:736,height:389,input:2,input:2,input:12,input:0,input_1_label:localNormal,input_2_label:localPosition,input_3_label:normTex,input_4_label:scale|A-1204-OUT,B-6180-XYZ,C-2910-TEX,D-2944-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:6180,x:30995,y:32922,varname:node_6180,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:1204,x:31012,y:32721,prsc:2,pt:False;n:type:ShaderForge.SFN_Slider,id:2944,x:30927,y:33277,ptovrint:False,ptlb:Scale,ptin:_Scale,varname:node_2944,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.1,cur:0.1652493,max:20;n:type:ShaderForge.SFN_Code,id:3108,x:31191,y:32468,varname:node_3108,prsc:2,code:bABvAGMAYQBsAE4AbwByAG0AYQBsACAAKgA9ACAAbABvAGMAYQBsAE4AbwByAG0AYQBsACAAKgAgAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAgACoAIABsAG8AYwBhAGwATgBvAHIAbQBhAGwAOwANAAoAbABvAGMAYQBsAE4AbwByAG0AYQBsACAAPQAgAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAuAHIAZwBiACAALwAgACgAbABvAGMAYQBsAE4AbwByAG0AYQBsAC4AcgAgACsAIABsAG8AYwBhAGwATgBvAHIAbQBhAGwALgBnACAAKwAgAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAuAGIAKQA7AA0ACgANAAoAbABvAGMAYQBsAFAAbwBzAGkAdABpAG8AbgAgAD0AIABsAG8AYwBhAGwAUABvAHMAaQB0AGkAbwBuAC8AcwBjAGEAbABlADsADQAKAGYAbABvAGEAdAAzACAAdABlAHgAMQAgAD0AIAB0AGUAeAAyAEQAKAB0AGUAeAAsAGwAbwBjAGEAbABQAG8AcwBpAHQAaQBvAG4ALgByAGcAKQA7AA0ACgBmAGwAbwBhAHQAMwAgAHQAZQB4ADIAIAA9ACAAdABlAHgAMgBEACgAdABlAHgALABsAG8AYwBhAGwAUABvAHMAaQB0AGkAbwBuAC4AcgBiACkAOwANAAoALwAvAHQAZQB4ADIAIAA9ACAAZgBsAG8AYQB0ADMAKAB0AGUAeAAyAC4AZwAsACAAdABlAHgAMgAuAGIALAAgAHQAZQB4ADIALgByACkAOwANAAoAZgBsAG8AYQB0ADMAIAB0AGUAeAAzACAAPQAgAHQAZQB4ADIARAAoAHQAZQB4ACwAbABvAGMAYQBsAFAAbwBzAGkAdABpAG8AbgAuAGcAYgApADsADQAKAC8ALwB0AGUAeAAzACAAPQAgAGYAbABvAGEAdAAzACgAdABlAHgAMwAuAGIALAAgAHQAZQB4ADMALgByACwAIAB0AGUAeAAzAC4AZwApADsADQAKAGYAbABvAGEAdAAzACAAbgBvAHIAbQBhAGwAUgBlAHMAdQBsAHQAIAA9ACAAKAB0AGUAeAAxACAAKgAgAGwAbwBjAGEAbABOAG8AcgBtAGEAbAAuAGIAIAArACAAdABlAHgAMgAgACoAIABsAG8AYwBhAGwATgBvAHIAbQBhAGwALgBnACAAKwAgAHQAZQB4ADMAIAAqACAAbABvAGMAYQBsAE4AbwByAG0AYQBsAC4AcgApADsADQAKAA0ACgByAGUAdAB1AHIAbgAgAG4AbwByAG0AYQBsAFIAZQBzAHUAbAB0ADsA,output:2,fname:TPM,width:751,height:305,input:2,input:2,input:12,input:0,input_1_label:localNormal,input_2_label:localPosition,input_3_label:tex,input_4_label:scale|A-1204-OUT,B-6180-XYZ,C-6804-TEX,D-2944-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:6804,x:30870,y:32376,ptovrint:False,ptlb:node_6804,ptin:_node_6804,varname:node_6804,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8431ea7b2b5c2fe4d82cd014033ba458,ntxv:0,isnm:False;proporder:358-1813-1990-2910-2944-6804;pass:END;sub:END;*/

Shader "Shader Forge/TPM Normal SF Edit" {
    Properties {
        _Metallic ("Metallic", Range(0, 1)) = 0
        _Gloss ("Gloss", Range(0, 1)) = 0.8
        _node_1990 ("node_1990", Color) = (1,1,1,1)
        _Normal ("Normal", 2D) = "black" {}
        _Scale ("Scale", Range(0.1, 20)) = 0.1652493
        _node_6804 ("node_6804", 2D) = "white" {}
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
            uniform float _Metallic;
            uniform float _Gloss;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            float4 TPMNormal( float3 localNormal , float3 localPosition , sampler2D normTex , float scale ){
            localNormal *= localNormal * localNormal * localNormal;
            localNormal = localNormal.rgb / (localNormal.r + localNormal.g + localNormal.b);
            
            localPosition = localPosition/scale;
            float4 tex1 = tex2D(normTex,localPosition.rg);
            float4 tex2 = tex2D(normTex,localPosition.rb);
            tex2 = float4(tex2.g, tex2.b, tex2.r, tex2.a);
            float4 tex3 = tex2D(normTex,localPosition.gb);
            tex3 = float4(tex3.b, tex3.r, tex3.g, tex3.a);
            float4 normalResult = (tex1 * localNormal.b + tex2 * localNormal.g + tex3 * localNormal.r);
            
            return normalResult;
            }
            
            uniform float _Scale;
            float3 TPM( float3 localNormal , float3 localPosition , sampler2D tex , float scale ){
            localNormal *= localNormal * localNormal * localNormal;
            localNormal = localNormal.rgb / (localNormal.r + localNormal.g + localNormal.b);
            
            localPosition = localPosition/scale;
            float3 tex1 = tex2D(tex,localPosition.rg);
            float3 tex2 = tex2D(tex,localPosition.rb);
            //tex2 = float3(tex2.g, tex2.b, tex2.r);
            float3 tex3 = tex2D(tex,localPosition.gb);
            //tex3 = float3(tex3.b, tex3.r, tex3.g);
            float3 normalResult = (tex1 * localNormal.b + tex2 * localNormal.g + tex3 * localNormal.r);
            
            return normalResult;
            }
            
            uniform sampler2D _node_6804; uniform float4 _node_6804_ST;
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
                float3 uneditedNormal : TEXCOORD6;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD9;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;

                ///CUSTOM STUFF!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                o.uneditedNormal = v.normal;
                //CUSTOM STUFF!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

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

                //CUSTOM STUFF!!!!!!! CHANGED i.normalDir TO i.uneditedNormal !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                float3 normalLocal = TPMNormal( i.uneditedNormal , i.posWorld.rgb , _Normal , _Scale );
                //CUSTOM STUFF!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
//                float3 normalDirection = normalLocal;// Perturbed normals
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
                float3 diffuseColor = TPM( i.uneditedNormal , i.posWorld.rgb , _node_6804 , _Scale ); // Need this for specular when using metallic
                float specularMonochrome;
                float3 specularColor;
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, _Metallic, specularColor, specularMonochrome );
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
            uniform float _Metallic;
            uniform float _Gloss;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            float3 TPMNormal( float3 localNormal , float3 localPosition , sampler2D normTex , float scale ){
            localNormal *= localNormal * localNormal * localNormal;
            localNormal = localNormal.rgb / (localNormal.r + localNormal.g + localNormal.b);
            
            localPosition = localPosition/scale;
            float3 tex1 = tex2D(normTex,localPosition.rg);
            float3 tex2 = tex2D(normTex,localPosition.rb);
            tex2 = float3(tex2.g, tex2.b, tex2.r);
            float3 tex3 = tex2D(normTex,localPosition.gb);
            tex3 = float3(tex3.b, tex3.r, tex3.g);
            float3 normalResult = (tex1 * localNormal.b + tex2 * localNormal.g + tex3 * localNormal.r);
            
            return normalResult;
            }
            
            uniform float _Scale;
            float3 TPM( float3 localNormal , float3 localPosition , sampler2D tex , float scale ){
            localNormal *= localNormal * localNormal * localNormal;
            localNormal = localNormal.rgb / (localNormal.r + localNormal.g + localNormal.b);
            
            localPosition = localPosition/scale;
            float3 tex1 = tex2D(tex,localPosition.rg);
            float3 tex2 = tex2D(tex,localPosition.rb);
            //tex2 = float3(tex2.g, tex2.b, tex2.r);
            float3 tex3 = tex2D(tex,localPosition.gb);
            //tex3 = float3(tex3.b, tex3.r, tex3.g);
            float3 normalResult = (tex1 * localNormal.b + tex2 * localNormal.g + tex3 * localNormal.r);
            
            return normalResult;
            }
            
            uniform sampler2D _node_6804; uniform float4 _node_6804_ST;
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
                float3 normalLocal = TPMNormal( i.normalDir , i.posWorld.rgb , _Normal , _Scale );
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
                float3 diffuseColor = TPM( i.normalDir , i.posWorld.rgb , _node_6804 , _Scale ); // Need this for specular when using metallic
                float specularMonochrome;
                float3 specularColor;
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, _Metallic, specularColor, specularMonochrome );
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
            uniform float _Metallic;
            uniform float _Gloss;
            uniform float _Scale;
            float3 TPM( float3 localNormal , float3 localPosition , sampler2D tex , float scale ){
            localNormal *= localNormal * localNormal * localNormal;
            localNormal = localNormal.rgb / (localNormal.r + localNormal.g + localNormal.b);
            
            localPosition = localPosition/scale;
            float3 tex1 = tex2D(tex,localPosition.rg);
            float3 tex2 = tex2D(tex,localPosition.rb);
            //tex2 = float3(tex2.g, tex2.b, tex2.r);
            float3 tex3 = tex2D(tex,localPosition.gb);
            //tex3 = float3(tex3.b, tex3.r, tex3.g);
            float3 normalResult = (tex1 * localNormal.b + tex2 * localNormal.g + tex3 * localNormal.r);
            
            return normalResult;
            }
            
            uniform sampler2D _node_6804; uniform float4 _node_6804_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv1 : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float3 normalDir : TEXCOORD3;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                o.Emission = 0;
                
                float3 diffColor = TPM( i.normalDir , i.posWorld.rgb , _node_6804 , _Scale );
                float specularMonochrome;
                float3 specColor;
                diffColor = DiffuseAndSpecularFromMetallic( diffColor, _Metallic, specColor, specularMonochrome );
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
