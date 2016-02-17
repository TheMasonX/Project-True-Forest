// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9843,x:32719,y:32712,varname:node_9843,prsc:2|diff-4648-OUT,emission-7183-OUT,alpha-8675-OUT;n:type:ShaderForge.SFN_VertexColor,id:7046,x:31383,y:32426,varname:node_7046,prsc:2;n:type:ShaderForge.SFN_ToggleProperty,id:9487,x:32146,y:32642,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:_Diffuse,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False;n:type:ShaderForge.SFN_OneMinus,id:9938,x:32146,y:32735,varname:node_9938,prsc:2|IN-9487-OUT;n:type:ShaderForge.SFN_Multiply,id:7183,x:32491,y:32754,varname:node_7183,prsc:2|A-2743-OUT,B-9938-OUT;n:type:ShaderForge.SFN_Multiply,id:4648,x:32512,y:32589,varname:node_4648,prsc:2|A-2743-OUT,B-9487-OUT;n:type:ShaderForge.SFN_Slider,id:4599,x:31660,y:32210,ptovrint:False,ptlb:Display Channel (0-4 = All R G B A),ptin:_DisplayChannel04AllRGBA,varname:_DisplayChannel04AllRGBA,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.9599892,max:4;n:type:ShaderForge.SFN_Code,id:2323,x:32055,y:32137,varname:node_2323,prsc:2,code:YwBoAGEAbgBuAGUAbABTAGUAbABlAGMAdABvAHIAIAA9ACAAcgBvAHUAbgBkACgAYwBoAGEAbgBuAGUAbABTAGUAbABlAGMAdABvAHIAKQA7AAoAaQBmACgAYwBoAGEAbgBuAGUAbABTAGUAbABlAGMAdABvAHIAIAA9AD0AIAAwACkACgB7AAoAcgBlAHQAdQByAG4AIABjAG8AbABvAHIAOwAKAH0ACgBlAGwAcwBlACAAaQBmACAAKABjAGgAYQBuAG4AZQBsAFMAZQBsAGUAYwB0AG8AcgAgAD0APQAgADEAKQAKAHsACgByAGUAdAB1AHIAbgAgAGYAbABvAGEAdAA0ACgAYwBvAGwAbwByAC4AcgAsADAALAAwACwAMQApADsACgB9AAoAZQBsAHMAZQAgAGkAZgAgACgAYwBoAGEAbgBuAGUAbABTAGUAbABlAGMAdABvAHIAIAA9AD0AIAAyACkACgB7AAoAcgBlAHQAdQByAG4AIABmAGwAbwBhAHQANAAoADAALABjAG8AbABvAHIALgBnACwAMAAsADEAKQA7AAoAfQAKAGUAbABzAGUAIABpAGYAIAAoAGMAaABhAG4AbgBlAGwAUwBlAGwAZQBjAHQAbwByACAAPQA9ACAAMwApAAoAewAKAHIAZQB0AHUAcgBuACAAZgBsAG8AYQB0ADQAKAAwACwAMAAsAGMAbwBsAG8AcgAuAGIALAAxACkAOwAKAH0ACgBlAGwAcwBlACAAaQBmACAAKABjAGgAYQBuAG4AZQBsAFMAZQBsAGUAYwB0AG8AcgAgAD0APQAgADQAKQAKAHsACgByAGUAdAB1AHIAbgAgAGYAbABvAGEAdAA0ACgAMQAsADEALAAxACwAYwBvAGwAbwByAC4AYQApADsACgB9AAoAcgBlAHQAdQByAG4AIABmAGwAbwBhAHQANAAoADEALAAwACwAMQAsADEAKQA7AA==,output:3,fname:DisplaySelectedChannel,width:340,height:348,input:3,input:0,input_1_label:color,input_2_label:channelSelector|A-4469-OUT,B-4599-OUT;n:type:ShaderForge.SFN_Append,id:4469,x:31751,y:32421,varname:node_4469,prsc:2|A-7046-RGB,B-7046-A;n:type:ShaderForge.SFN_ComponentMask,id:2743,x:31924,y:32525,varname:node_2743,prsc:2,cc1:0,cc2:1,cc3:2,cc4:-1|IN-2323-OUT;n:type:ShaderForge.SFN_ComponentMask,id:8675,x:31924,y:32663,varname:node_8675,prsc:2,cc1:3,cc2:-1,cc3:-1,cc4:-1|IN-2323-OUT;proporder:9487-4599;pass:END;sub:END;*/

Shader "TMX/Debug/Vertex Color" {
    Properties {
        [MaterialToggle] _Diffuse ("Diffuse", Float ) = 0
        _DisplayChannel04AllRGBA ("Display Channel (0-4 = All R G B A)", Range(0, 4)) = 0.9599892
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
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform fixed _Diffuse;
            uniform fixed _DisplayChannel04AllRGBA;
            float4 DisplaySelectedChannel( float4 color , float channelSelector ){
            channelSelector = round(channelSelector);
            if(channelSelector == 0)
            {
            return color;
            }
            else if (channelSelector == 1)
            {
            return float4(color.r,0,0,1);
            }
            else if (channelSelector == 2)
            {
            return float4(0,color.g,0,1);
            }
            else if (channelSelector == 3)
            {
            return float4(0,0,color.b,1);
            }
            else if (channelSelector == 4)
            {
            return float4(1,1,1,color.a);
            }
            return float4(1,0,1,1);
            }
            
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(_Object2World, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 node_2323 = DisplaySelectedChannel( float4(i.vertexColor.rgb,i.vertexColor.a) , _DisplayChannel04AllRGBA );
                float3 node_2743 = node_2323.rgb;
                float3 diffuseColor = (node_2743*_Diffuse);
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = (node_2743*(1.0 - _Diffuse));
/// Final Color:
                float3 finalColor = diffuse + emissive;
                fixed4 finalRGBA = fixed4(finalColor,node_2323.a);
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
            #pragma multi_compile_fwdadd
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform fixed _Diffuse;
            uniform fixed _DisplayChannel04AllRGBA;
            float4 DisplaySelectedChannel( float4 color , float channelSelector ){
            channelSelector = round(channelSelector);
            if(channelSelector == 0)
            {
            return color;
            }
            else if (channelSelector == 1)
            {
            return float4(color.r,0,0,1);
            }
            else if (channelSelector == 2)
            {
            return float4(0,color.g,0,1);
            }
            else if (channelSelector == 3)
            {
            return float4(0,0,color.b,1);
            }
            else if (channelSelector == 4)
            {
            return float4(1,1,1,color.a);
            }
            return float4(1,0,1,1);
            }
            
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
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
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
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
                float4 node_2323 = DisplaySelectedChannel( float4(i.vertexColor.rgb,i.vertexColor.a) , _DisplayChannel04AllRGBA );
                float3 node_2743 = node_2323.rgb;
                float3 diffuseColor = (node_2743*_Diffuse);
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * node_2323.a,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
