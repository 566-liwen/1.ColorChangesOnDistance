// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/test"
{
    Properties
    {
    }
    SubShader
    {
        Pass {
              CGPROGRAM
        #pragma vertex vert
        #pragma fragment frag

        struct VertInput
        {
            float4 pos : POSITION;
        };

        struct VertOutput
        {
            float4 pos : SV_POSITION;
            half3 color : COLOR;
        };

        VertOutput vert(VertInput vi) {
            VertOutput o;

            o.color = vi.pos.xyz;
            o.pos = UnityObjectToClipPos(vi.pos);
          
            return o;
        }

        half4 frag(VertOutput i) : COLOR{
            return half4(i.color, 1.0f);
        }


        ENDCG
        }
    }
    FallBack "Diffuse"
}
