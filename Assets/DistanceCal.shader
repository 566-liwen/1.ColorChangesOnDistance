Shader "Unlit/DistanceCal"
{
    Properties
    {
        //_MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        //Tags { "RenderType"="Opaque" }
        //LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            struct VertInput
            {
                float4 pos : POSITION;
                //float2 uv : TEXCOORD0;
            };

            struct VertOutput
            {
                float4 pos : SV_POSITION;
                //float dis : TEXCOORD0;
                half3 color : COLOR;
            };

            VertOutput vert(VertInput v) {
                VertOutput o;

                float3 _Camera_Position = _WorldSpaceCameraPos; //xyz

                o.pos = UnityObjectToClipPos(v.pos);
                float4 worldPos = mul(unity_ObjectToWorld, v.pos);
                //o.dis= distance(_Camera_Position, worldPos);
                float dis = worldPos.z - _Camera_Position.z;
                o.color = half3(0, 0, 10/dis);

                return o;
            }

            half4 frag(VertOutput i) : COLOR{
                return half4(i.color, 1.0f);
            }
            ENDCG
        }
    }
}
