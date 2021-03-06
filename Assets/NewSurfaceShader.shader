Shader "Custom/NewSurfaceShader"
{
    Properties
    {
    }
    SubShader
    {
        CGPROGRAM
        //#pragma fragment particleSpherePS

        struct PSOutput
        {
            float4 fragDepth;
            float4 fragColor;
        };

        PSOutput particleSpherePS(
            float2 texCoord : TEXCOORD0,
            float3 eyeSpacePos : TEXCOORD1,
            float sphereRadius : TEXCOORD2,
            float4 color : COLOR0)
        {
            PSOutput OUT;
            // calculate eye-space sphere normal from texture coordinates
            float3 N;
            N.xy = texCoord * 2.0 - 1.0;
            float r2 = dot(N.xy, N.xy);
            if (r2 > 1.0) discard; // kill pixels outside circle
            N.z = -sqrt(1.0 - r2);
            // calculate depth
            float4 pixelPos = float4(eyeSpacePos + N * sphereRadius, 1.0);
            float4 clipSpacePos = mul(pixelPos, ProjectionMatrix);
            OUT.fragDepth = clipSpacePos.z / clipSpacePos.w;
            float diffuse = max(0.0, dot(N, lightDir));
            OUT.fragColor = diffuse * color;
            
            return OUT;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
