// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:2,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:2,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:2865,x:31919,y:30085,varname:node_2865,prsc:2|diff-1701-OUT;n:type:ShaderForge.SFN_Vector1,id:2133,x:29879,y:29985,varname:node_2133,prsc:2,v1:0;n:type:ShaderForge.SFN_Vector1,id:1371,x:29879,y:30036,varname:node_1371,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:8437,x:29879,y:30082,varname:node_8437,prsc:2,v1:2;n:type:ShaderForge.SFN_Vector1,id:9918,x:29715,y:30173,varname:node_9918,prsc:2,v1:3;n:type:ShaderForge.SFN_Vector1,id:5859,x:29879,y:30189,varname:node_5859,prsc:2,v1:4;n:type:ShaderForge.SFN_Tex2d,id:5313,x:30283,y:30424,varname:node_5313,prsc:2,tex:400cf02f268b02e4497feb50a409aaf6,ntxv:0,isnm:False|UVIN-978-UVOUT,MIP-1181-OUT,TEX-1482-TEX;n:type:ShaderForge.SFN_Tex2d,id:752,x:30283,y:30904,varname:node_752,prsc:2,tex:400cf02f268b02e4497feb50a409aaf6,ntxv:0,isnm:False|UVIN-5905-UVOUT,MIP-1181-OUT,TEX-1482-TEX;n:type:ShaderForge.SFN_Tex2d,id:1909,x:30283,y:30786,varname:node_1909,prsc:2,tex:400cf02f268b02e4497feb50a409aaf6,ntxv:0,isnm:False|UVIN-5627-UVOUT,MIP-1181-OUT,TEX-1482-TEX;n:type:ShaderForge.SFN_Tex2d,id:4928,x:30283,y:30667,varname:node_4928,prsc:2,tex:400cf02f268b02e4497feb50a409aaf6,ntxv:0,isnm:False|UVIN-7585-UVOUT,MIP-1181-OUT,TEX-1482-TEX;n:type:ShaderForge.SFN_Tex2d,id:5171,x:30283,y:30552,varname:node_5171,prsc:2,tex:400cf02f268b02e4497feb50a409aaf6,ntxv:0,isnm:False|UVIN-1080-UVOUT,MIP-1181-OUT,TEX-1482-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:1482,x:30283,y:31068,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:_Diffuse,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:400cf02f268b02e4497feb50a409aaf6,ntxv:0,isnm:False;n:type:ShaderForge.SFN_UVTile,id:978,x:30076,y:30424,varname:node_978,prsc:2|UVIN-9650-OUT,WDT-9918-OUT,HGT-9918-OUT,TILE-2133-OUT;n:type:ShaderForge.SFN_UVTile,id:1080,x:30076,y:30552,varname:node_1080,prsc:2|UVIN-9584-OUT,WDT-9918-OUT,HGT-9918-OUT,TILE-1371-OUT;n:type:ShaderForge.SFN_UVTile,id:7585,x:30076,y:30667,varname:node_7585,prsc:2|UVIN-7109-OUT,WDT-9918-OUT,HGT-9918-OUT,TILE-8437-OUT;n:type:ShaderForge.SFN_UVTile,id:5627,x:30076,y:30786,varname:node_5627,prsc:2|UVIN-2146-OUT,WDT-9918-OUT,HGT-9918-OUT,TILE-9918-OUT;n:type:ShaderForge.SFN_UVTile,id:5905,x:30076,y:30904,varname:node_5905,prsc:2|UVIN-7939-OUT,WDT-9918-OUT,HGT-9918-OUT,TILE-5859-OUT;n:type:ShaderForge.SFN_VertexColor,id:3985,x:30271,y:30298,varname:node_3985,prsc:2;n:type:ShaderForge.SFN_ChannelBlend,id:1701,x:30655,y:30686,varname:node_1701,prsc:2,chbt:1|M-2520-OUT,R-5313-RGB,G-5171-RGB,B-4928-RGB,A-1909-RGB,BTM-752-RGB;n:type:ShaderForge.SFN_Append,id:2520,x:30552,y:30349,varname:node_2520,prsc:2|A-3985-RGB,B-3985-A;n:type:ShaderForge.SFN_Frac,id:7109,x:29901,y:30667,varname:node_7109,prsc:2|IN-884-OUT;n:type:ShaderForge.SFN_Frac,id:2146,x:29904,y:30786,varname:node_2146,prsc:2|IN-2453-OUT;n:type:ShaderForge.SFN_Frac,id:7939,x:29904,y:30904,varname:node_7939,prsc:2|IN-6278-OUT;n:type:ShaderForge.SFN_Multiply,id:4549,x:29726,y:30424,varname:node_4549,prsc:2|A-1852-UVOUT,B-4576-OUT;n:type:ShaderForge.SFN_Multiply,id:2771,x:29726,y:30552,varname:node_2771,prsc:2|A-1852-UVOUT,B-9461-OUT;n:type:ShaderForge.SFN_Multiply,id:884,x:29729,y:30667,varname:node_884,prsc:2|A-1852-UVOUT,B-5362-OUT;n:type:ShaderForge.SFN_Multiply,id:2453,x:29729,y:30786,varname:node_2453,prsc:2|A-1852-UVOUT,B-573-OUT;n:type:ShaderForge.SFN_Multiply,id:6278,x:29729,y:30904,varname:node_6278,prsc:2|A-1852-UVOUT,B-638-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4576,x:29545,y:30440,ptovrint:False,ptlb:FR,ptin:_FR,varname:_FR,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:9461,x:29547,y:30570,ptovrint:False,ptlb:FG,ptin:_FG,varname:_FG,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:5362,x:29527,y:30686,ptovrint:False,ptlb:FB,ptin:_FB,varname:_FB,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:573,x:29547,y:30805,ptovrint:False,ptlb:FA,ptin:_FA,varname:_FA,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:638,x:29547,y:30924,ptovrint:False,ptlb:Fbase,ptin:_Fbase,varname:_Fbase,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_TexCoord,id:1852,x:29141,y:30698,varname:node_1852,prsc:2,uv:0;n:type:ShaderForge.SFN_Frac,id:9584,x:29904,y:30552,varname:node_9584,prsc:2|IN-2771-OUT;n:type:ShaderForge.SFN_Frac,id:9650,x:29904,y:30424,varname:node_9650,prsc:2|IN-4549-OUT;n:type:ShaderForge.SFN_Vector1,id:1181,x:30112,y:30298,varname:node_1181,prsc:2,v1:0;proporder:1482-638-573-5362-9461-4576;pass:END;sub:END;*/

Shader "Shader Forge/triplanar" {
    Properties {
        _Diffuse ("Diffuse", 2D) = "white" {}
        _Fbase ("Fbase", Float ) = 1
        _FA ("FA", Float ) = 1
        _FB ("FB", Float ) = 1
        _FG ("FG", Float ) = 1
        _FR ("FR", Float ) = 1
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
            #pragma glsl
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float _FR;
            uniform float _FG;
            uniform float _FB;
            uniform float _FA;
            uniform float _Fbase;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD10;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.vertexColor = v.vertexColor;
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
                float3 normalDirection = i.normalDir;
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
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
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - 0;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                float4 node_2520 = float4(i.vertexColor.rgb,i.vertexColor.a);
                float node_9918 = 3.0;
                float node_5859 = 4.0;
                float2 node_5905_tc_rcp = float2(1.0,1.0)/float2( node_9918, node_9918 );
                float node_5905_ty = floor(node_5859 * node_5905_tc_rcp.x);
                float node_5905_tx = node_5859 - node_9918 * node_5905_ty;
                float2 node_5905 = (frac((i.uv0*_Fbase)) + float2(node_5905_tx, node_5905_ty)) * node_5905_tc_rcp;
                float node_1181 = 0.0;
                float4 node_752 = tex2Dlod(_Diffuse,float4(TRANSFORM_TEX(node_5905, _Diffuse),0.0,node_1181));
                float node_2133 = 0.0;
                float2 node_978_tc_rcp = float2(1.0,1.0)/float2( node_9918, node_9918 );
                float node_978_ty = floor(node_2133 * node_978_tc_rcp.x);
                float node_978_tx = node_2133 - node_9918 * node_978_ty;
                float2 node_978 = (frac((i.uv0*_FR)) + float2(node_978_tx, node_978_ty)) * node_978_tc_rcp;
                float4 node_5313 = tex2Dlod(_Diffuse,float4(TRANSFORM_TEX(node_978, _Diffuse),0.0,node_1181));
                float node_1371 = 1.0;
                float2 node_1080_tc_rcp = float2(1.0,1.0)/float2( node_9918, node_9918 );
                float node_1080_ty = floor(node_1371 * node_1080_tc_rcp.x);
                float node_1080_tx = node_1371 - node_9918 * node_1080_ty;
                float2 node_1080 = (frac((i.uv0*_FG)) + float2(node_1080_tx, node_1080_ty)) * node_1080_tc_rcp;
                float4 node_5171 = tex2Dlod(_Diffuse,float4(TRANSFORM_TEX(node_1080, _Diffuse),0.0,node_1181));
                float node_8437 = 2.0;
                float2 node_7585_tc_rcp = float2(1.0,1.0)/float2( node_9918, node_9918 );
                float node_7585_ty = floor(node_8437 * node_7585_tc_rcp.x);
                float node_7585_tx = node_8437 - node_9918 * node_7585_ty;
                float2 node_7585 = (frac((i.uv0*_FB)) + float2(node_7585_tx, node_7585_ty)) * node_7585_tc_rcp;
                float4 node_4928 = tex2Dlod(_Diffuse,float4(TRANSFORM_TEX(node_7585, _Diffuse),0.0,node_1181));
                float2 node_5627_tc_rcp = float2(1.0,1.0)/float2( node_9918, node_9918 );
                float node_5627_ty = floor(node_9918 * node_5627_tc_rcp.x);
                float node_5627_tx = node_9918 - node_9918 * node_5627_ty;
                float2 node_5627 = (frac((i.uv0*_FA)) + float2(node_5627_tx, node_5627_ty)) * node_5627_tc_rcp;
                float4 node_1909 = tex2Dlod(_Diffuse,float4(TRANSFORM_TEX(node_5627, _Diffuse),0.0,node_1181));
                float3 diffuseColor = (lerp( lerp( lerp( lerp( node_752.rgb, node_5313.rgb, node_2520.r ), node_5171.rgb, node_2520.g ), node_4928.rgb, node_2520.b ), node_1909.rgb, node_2520.a ));
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
            #pragma glsl
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float _FR;
            uniform float _FG;
            uniform float _FB;
            uniform float _FA;
            uniform float _Fbase;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.vertexColor = v.vertexColor;
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
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 node_2520 = float4(i.vertexColor.rgb,i.vertexColor.a);
                float node_9918 = 3.0;
                float node_5859 = 4.0;
                float2 node_5905_tc_rcp = float2(1.0,1.0)/float2( node_9918, node_9918 );
                float node_5905_ty = floor(node_5859 * node_5905_tc_rcp.x);
                float node_5905_tx = node_5859 - node_9918 * node_5905_ty;
                float2 node_5905 = (frac((i.uv0*_Fbase)) + float2(node_5905_tx, node_5905_ty)) * node_5905_tc_rcp;
                float node_1181 = 0.0;
                float4 node_752 = tex2Dlod(_Diffuse,float4(TRANSFORM_TEX(node_5905, _Diffuse),0.0,node_1181));
                float node_2133 = 0.0;
                float2 node_978_tc_rcp = float2(1.0,1.0)/float2( node_9918, node_9918 );
                float node_978_ty = floor(node_2133 * node_978_tc_rcp.x);
                float node_978_tx = node_2133 - node_9918 * node_978_ty;
                float2 node_978 = (frac((i.uv0*_FR)) + float2(node_978_tx, node_978_ty)) * node_978_tc_rcp;
                float4 node_5313 = tex2Dlod(_Diffuse,float4(TRANSFORM_TEX(node_978, _Diffuse),0.0,node_1181));
                float node_1371 = 1.0;
                float2 node_1080_tc_rcp = float2(1.0,1.0)/float2( node_9918, node_9918 );
                float node_1080_ty = floor(node_1371 * node_1080_tc_rcp.x);
                float node_1080_tx = node_1371 - node_9918 * node_1080_ty;
                float2 node_1080 = (frac((i.uv0*_FG)) + float2(node_1080_tx, node_1080_ty)) * node_1080_tc_rcp;
                float4 node_5171 = tex2Dlod(_Diffuse,float4(TRANSFORM_TEX(node_1080, _Diffuse),0.0,node_1181));
                float node_8437 = 2.0;
                float2 node_7585_tc_rcp = float2(1.0,1.0)/float2( node_9918, node_9918 );
                float node_7585_ty = floor(node_8437 * node_7585_tc_rcp.x);
                float node_7585_tx = node_8437 - node_9918 * node_7585_ty;
                float2 node_7585 = (frac((i.uv0*_FB)) + float2(node_7585_tx, node_7585_ty)) * node_7585_tc_rcp;
                float4 node_4928 = tex2Dlod(_Diffuse,float4(TRANSFORM_TEX(node_7585, _Diffuse),0.0,node_1181));
                float2 node_5627_tc_rcp = float2(1.0,1.0)/float2( node_9918, node_9918 );
                float node_5627_ty = floor(node_9918 * node_5627_tc_rcp.x);
                float node_5627_tx = node_9918 - node_9918 * node_5627_ty;
                float2 node_5627 = (frac((i.uv0*_FA)) + float2(node_5627_tx, node_5627_ty)) * node_5627_tc_rcp;
                float4 node_1909 = tex2Dlod(_Diffuse,float4(TRANSFORM_TEX(node_5627, _Diffuse),0.0,node_1181));
                float3 diffuseColor = (lerp( lerp( lerp( lerp( node_752.rgb, node_5313.rgb, node_2520.r ), node_5171.rgb, node_2520.g ), node_4928.rgb, node_2520.b ), node_1909.rgb, node_2520.a ));
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
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
            #pragma glsl
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float _FR;
            uniform float _FG;
            uniform float _FB;
            uniform float _FA;
            uniform float _Fbase;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.vertexColor = v.vertexColor;
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
                return o;
            }
            float4 frag(VertexOutput i) : SV_Target {
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                UnityMetaInput o;
                UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
                
                o.Emission = 0;
                
                float4 node_2520 = float4(i.vertexColor.rgb,i.vertexColor.a);
                float node_9918 = 3.0;
                float node_5859 = 4.0;
                float2 node_5905_tc_rcp = float2(1.0,1.0)/float2( node_9918, node_9918 );
                float node_5905_ty = floor(node_5859 * node_5905_tc_rcp.x);
                float node_5905_tx = node_5859 - node_9918 * node_5905_ty;
                float2 node_5905 = (frac((i.uv0*_Fbase)) + float2(node_5905_tx, node_5905_ty)) * node_5905_tc_rcp;
                float node_1181 = 0.0;
                float4 node_752 = tex2Dlod(_Diffuse,float4(TRANSFORM_TEX(node_5905, _Diffuse),0.0,node_1181));
                float node_2133 = 0.0;
                float2 node_978_tc_rcp = float2(1.0,1.0)/float2( node_9918, node_9918 );
                float node_978_ty = floor(node_2133 * node_978_tc_rcp.x);
                float node_978_tx = node_2133 - node_9918 * node_978_ty;
                float2 node_978 = (frac((i.uv0*_FR)) + float2(node_978_tx, node_978_ty)) * node_978_tc_rcp;
                float4 node_5313 = tex2Dlod(_Diffuse,float4(TRANSFORM_TEX(node_978, _Diffuse),0.0,node_1181));
                float node_1371 = 1.0;
                float2 node_1080_tc_rcp = float2(1.0,1.0)/float2( node_9918, node_9918 );
                float node_1080_ty = floor(node_1371 * node_1080_tc_rcp.x);
                float node_1080_tx = node_1371 - node_9918 * node_1080_ty;
                float2 node_1080 = (frac((i.uv0*_FG)) + float2(node_1080_tx, node_1080_ty)) * node_1080_tc_rcp;
                float4 node_5171 = tex2Dlod(_Diffuse,float4(TRANSFORM_TEX(node_1080, _Diffuse),0.0,node_1181));
                float node_8437 = 2.0;
                float2 node_7585_tc_rcp = float2(1.0,1.0)/float2( node_9918, node_9918 );
                float node_7585_ty = floor(node_8437 * node_7585_tc_rcp.x);
                float node_7585_tx = node_8437 - node_9918 * node_7585_ty;
                float2 node_7585 = (frac((i.uv0*_FB)) + float2(node_7585_tx, node_7585_ty)) * node_7585_tc_rcp;
                float4 node_4928 = tex2Dlod(_Diffuse,float4(TRANSFORM_TEX(node_7585, _Diffuse),0.0,node_1181));
                float2 node_5627_tc_rcp = float2(1.0,1.0)/float2( node_9918, node_9918 );
                float node_5627_ty = floor(node_9918 * node_5627_tc_rcp.x);
                float node_5627_tx = node_9918 - node_9918 * node_5627_ty;
                float2 node_5627 = (frac((i.uv0*_FA)) + float2(node_5627_tx, node_5627_ty)) * node_5627_tc_rcp;
                float4 node_1909 = tex2Dlod(_Diffuse,float4(TRANSFORM_TEX(node_5627, _Diffuse),0.0,node_1181));
                float3 diffColor = (lerp( lerp( lerp( lerp( node_752.rgb, node_5313.rgb, node_2520.r ), node_5171.rgb, node_2520.g ), node_4928.rgb, node_2520.b ), node_1909.rgb, node_2520.a ));
                o.Albedo = diffColor;
                
                return UnityMetaFragment( o );
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
