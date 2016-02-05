// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:1,vtps:0,hqsc:True,nrmq:1,nrsp:2,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:30686,y:30613,varname:node_2865,prsc:2|diff-6253-OUT,spec-1896-OUT,gloss-1170-OUT,normal-6143-OUT;n:type:ShaderForge.SFN_Tex2d,id:4798,x:29599,y:30974,varname:Tex2,prsc:2,tex:ab819437bc5776948ac0e1bb58701c49,ntxv:3,isnm:True|UVIN-3224-OUT,TEX-9318-TEX;n:type:ShaderForge.SFN_Slider,id:1170,x:29905,y:30933,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:_Gloss,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.0880576,max:1;n:type:ShaderForge.SFN_FragmentPosition,id:6384,x:28110,y:31315,varname:node_6384,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:7859,x:28110,y:31476,ptovrint:False,ptlb:TexScale_copy,ptin:_TexScale_copy,varname:_TexScale_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Append,id:3224,x:28531,y:31310,varname:TEX2_UV,prsc:2|A-6384-X,B-6384-Z;n:type:ShaderForge.SFN_Tex2dAsset,id:9318,x:28894,y:30434,ptovrint:False,ptlb:Normal Map,ptin:_NormalMap,varname:_NormalMap,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ab819437bc5776948ac0e1bb58701c49,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Multiply,id:5691,x:28795,y:31996,varname:node_5691,prsc:2|A-3224-OUT,B-7859-OUT;n:type:ShaderForge.SFN_Frac,id:2190,x:28970,y:31996,varname:node_2190,prsc:2|IN-5691-OUT;n:type:ShaderForge.SFN_Append,id:3307,x:28531,y:31523,varname:TEX3_UV,prsc:2|A-6384-X,B-6384-Y;n:type:ShaderForge.SFN_Multiply,id:583,x:28795,y:32120,varname:node_583,prsc:2|A-3307-OUT,B-7859-OUT;n:type:ShaderForge.SFN_Frac,id:3885,x:28970,y:32120,varname:node_3885,prsc:2|IN-583-OUT;n:type:ShaderForge.SFN_Append,id:3631,x:28531,y:31148,varname:TEX1_UV,prsc:2|A-6384-Y,B-6384-Z;n:type:ShaderForge.SFN_Multiply,id:242,x:28795,y:31874,varname:node_242,prsc:2|A-3631-OUT,B-7859-OUT;n:type:ShaderForge.SFN_Frac,id:1459,x:28970,y:31874,varname:node_1459,prsc:2|IN-242-OUT;n:type:ShaderForge.SFN_Tex2d,id:4877,x:29600,y:31357,varname:Tex3,prsc:2,tex:ab819437bc5776948ac0e1bb58701c49,ntxv:0,isnm:False|UVIN-3307-OUT,TEX-9318-TEX;n:type:ShaderForge.SFN_Tex2d,id:6706,x:29592,y:30540,varname:Tex1,prsc:2,tex:ab819437bc5776948ac0e1bb58701c49,ntxv:0,isnm:False|UVIN-3631-OUT,TEX-9318-TEX;n:type:ShaderForge.SFN_ComponentMask,id:4356,x:28866,y:30645,varname:Link,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-2704-OUT;n:type:ShaderForge.SFN_Negate,id:3493,x:28675,y:30864,cmnt:negatron,varname:node_3493,prsc:2|IN-2704-OUT;n:type:ShaderForge.SFN_ComponentMask,id:9528,x:28881,y:30864,varname:DarkLink,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-3493-OUT;n:type:ShaderForge.SFN_Append,id:1335,x:29355,y:30963,varname:node_1335,prsc:2|A-4356-G,B-9528-R,C-4356-B;n:type:ShaderForge.SFN_Append,id:4349,x:29355,y:31384,varname:node_4349,prsc:2|A-4356-B,B-4356-G,C-9528-R;n:type:ShaderForge.SFN_Append,id:6438,x:29339,y:30467,varname:node_6438,prsc:2|A-9528-G,B-4356-R,C-4356-B;n:type:ShaderForge.SFN_ChannelBlend,id:6929,x:29600,y:31180,cmnt:Channel Blend Junk,varname:node_6929,prsc:2,chbt:0|M-4798-RGB,R-1335-OUT,G-6413-OUT,B-5914-OUT;n:type:ShaderForge.SFN_ChannelBlend,id:6193,x:29613,y:31525,varname:node_6193,prsc:2,chbt:0|M-4877-RGB,R-4349-OUT,G-2208-OUT,B-5914-OUT;n:type:ShaderForge.SFN_ChannelBlend,id:3507,x:29592,y:30718,varname:node_3507,prsc:2,chbt:0|M-6706-RGB,R-6438-OUT,G-2039-OUT,B-5914-OUT;n:type:ShaderForge.SFN_ChannelBlend,id:6143,x:29976,y:31447,varname:node_6143,prsc:2,chbt:0|M-54-OUT,R-3507-OUT,G-6929-OUT,B-6193-OUT;n:type:ShaderForge.SFN_Append,id:6413,x:29355,y:31106,varname:node_6413,prsc:2|A-4356-R,B-9528-B,C-4356-G;n:type:ShaderForge.SFN_Append,id:2208,x:29355,y:31518,varname:node_2208,prsc:2|A-4356-R,B-4356-B,C-9528-G;n:type:ShaderForge.SFN_Append,id:2039,x:29339,y:30595,varname:node_2039,prsc:2|A-9528-B,B-4356-G,C-4356-R;n:type:ShaderForge.SFN_Slider,id:1896,x:29905,y:30818,ptovrint:False,ptlb:Metallic,ptin:_Metallic,varname:_Metallic,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Abs,id:2704,x:28473,y:30799,varname:node_2704,prsc:2|IN-5914-OUT;n:type:ShaderForge.SFN_NormalVector,id:5914,x:28347,y:30338,prsc:2,pt:False;n:type:ShaderForge.SFN_Multiply,id:54,x:29592,y:30367,varname:DoubleDragon,prsc:2|A-5914-OUT,B-5914-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6253,x:30334,y:30524,ptovrint:False,ptlb:node_6253,ptin:_node_6253,varname:_node_6253,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:7859-9318-1170-1896-6253;pass:END;sub:END;*/

Shader "Shader Forge/triplanar" {
    Properties {
        _TexScale_copy ("TexScale_copy", Float ) = 1
        _NormalMap ("Normal Map", 2D) = "bump" {}
        _Gloss ("Gloss", Range(0, 1)) = 0.0880576
        _Metallic ("Metallic", Range(0, 1)) = 0
        _node_6253 ("node_6253", Float ) = 1
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
            uniform float _Gloss;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float _Metallic;
            uniform float _node_6253;
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
                float3 DoubleDragon = (i.normalDir*i.normalDir);
                float2 TEX1_UV = float2(i.posWorld.g,i.posWorld.b);
                float3 Tex1 = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(TEX1_UV, _NormalMap)));
                float3 node_2704 = abs(i.normalDir);
                float3 DarkLink = (-1*node_2704).rgb;
                float3 Link = node_2704.rgb;
                float2 TEX2_UV = float2(i.posWorld.r,i.posWorld.b);
                float3 Tex2 = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(TEX2_UV, _NormalMap)));
                float2 TEX3_UV = float2(i.posWorld.r,i.posWorld.g);
                float3 Tex3 = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(TEX3_UV, _NormalMap)));
                float3 normalDirection = (DoubleDragon.r*(Tex1.rgb.r*float3(DarkLink.g,Link.r,Link.b) + Tex1.rgb.g*float3(DarkLink.b,Link.g,Link.r) + Tex1.rgb.b*i.normalDir) + DoubleDragon.g*(Tex2.rgb.r*float3(Link.g,DarkLink.r,Link.b) + Tex2.rgb.g*float3(Link.r,DarkLink.b,Link.g) + Tex2.rgb.b*i.normalDir) + DoubleDragon.b*(Tex3.rgb.r*float3(Link.b,Link.g,DarkLink.r) + Tex3.rgb.g*float3(Link.r,Link.b,DarkLink.g) + Tex3.rgb.b*i.normalDir));
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
                float3 diffuseColor = float3(_node_6253,_node_6253,_node_6253); // Need this for specular when using metallic
                float specularMonochrome;
                float3 specularColor;
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, _Metallic, specularColor, specularMonochrome );
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
            uniform float _Gloss;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float _Metallic;
            uniform float _node_6253;
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
                float3 DoubleDragon = (i.normalDir*i.normalDir);
                float2 TEX1_UV = float2(i.posWorld.g,i.posWorld.b);
                float3 Tex1 = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(TEX1_UV, _NormalMap)));
                float3 node_2704 = abs(i.normalDir);
                float3 DarkLink = (-1*node_2704).rgb;
                float3 Link = node_2704.rgb;
                float2 TEX2_UV = float2(i.posWorld.r,i.posWorld.b);
                float3 Tex2 = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(TEX2_UV, _NormalMap)));
                float2 TEX3_UV = float2(i.posWorld.r,i.posWorld.g);
                float3 Tex3 = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(TEX3_UV, _NormalMap)));
                float3 normalDirection = (DoubleDragon.r*(Tex1.rgb.r*float3(DarkLink.g,Link.r,Link.b) + Tex1.rgb.g*float3(DarkLink.b,Link.g,Link.r) + Tex1.rgb.b*i.normalDir) + DoubleDragon.g*(Tex2.rgb.r*float3(Link.g,DarkLink.r,Link.b) + Tex2.rgb.g*float3(Link.r,DarkLink.b,Link.g) + Tex2.rgb.b*i.normalDir) + DoubleDragon.b*(Tex3.rgb.r*float3(Link.b,Link.g,DarkLink.r) + Tex3.rgb.g*float3(Link.r,Link.b,DarkLink.g) + Tex3.rgb.b*i.normalDir));
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
                float3 diffuseColor = float3(_node_6253,_node_6253,_node_6253); // Need this for specular when using metallic
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
            uniform float _Gloss;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float _Metallic;
            uniform float _node_6253;
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
                float3 DoubleDragon = (i.normalDir*i.normalDir);
                float2 TEX1_UV = float2(i.posWorld.g,i.posWorld.b);
                float3 Tex1 = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(TEX1_UV, _NormalMap)));
                float3 node_2704 = abs(i.normalDir);
                float3 DarkLink = (-1*node_2704).rgb;
                float3 Link = node_2704.rgb;
                float2 TEX2_UV = float2(i.posWorld.r,i.posWorld.b);
                float3 Tex2 = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(TEX2_UV, _NormalMap)));
                float2 TEX3_UV = float2(i.posWorld.r,i.posWorld.g);
                float3 Tex3 = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(TEX3_UV, _NormalMap)));
                float3 normalDirection = (DoubleDragon.r*(Tex1.rgb.r*float3(DarkLink.g,Link.r,Link.b) + Tex1.rgb.g*float3(DarkLink.b,Link.g,Link.r) + Tex1.rgb.b*i.normalDir) + DoubleDragon.g*(Tex2.rgb.r*float3(Link.g,DarkLink.r,Link.b) + Tex2.rgb.g*float3(Link.r,DarkLink.b,Link.g) + Tex2.rgb.b*i.normalDir) + DoubleDragon.b*(Tex3.rgb.r*float3(Link.b,Link.g,DarkLink.r) + Tex3.rgb.g*float3(Link.r,Link.b,DarkLink.g) + Tex3.rgb.b*i.normalDir));
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
                float3 diffuseColor = float3(_node_6253,_node_6253,_node_6253); // Need this for specular when using metallic
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
            uniform float _Gloss;
            uniform float _Metallic;
            uniform float _node_6253;
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
                
                float3 diffColor = float3(_node_6253,_node_6253,_node_6253);
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
