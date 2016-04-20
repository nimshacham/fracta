Shader "Fracta/Unlit/Mandelbrot_v1"
{
	Properties
	{
		_MainTex("Texture", 2D) = "white" {}
		_MyItr("Iterations",Range(0,200)) = 10
		_MyRed("Red",Range(0.0,1.0))	 = 1.0
		_MyBlue("Blue",Range(0.0,1.0))	 = 0.0
		_MyGreen("Green",Range(0.0,1.0))	 = 0.0
	}
	SubShader
	{
		// No culling or depth
		Cull Off ZWrite Off ZTest Always

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			float _MyGreen;
			float _MyRed;
			float _MyBlue;
			float _MyItr = 10;
//			#include "UnityCG.cginc"

			struct vert_in
			{
				float4 pos : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 pos : SV_POSITION;
			};

			v2f vert (vert_in v_in)
			{
				v2f o;
				o.pos = mul(UNITY_MATRIX_MVP, v_in.pos);
				o.uv = v_in.uv;
				return o;
			}
			
//			sampler2D _MainTex;

//			fixed4 frag (vert_out i) : SV_Target
//			{
//				fixed4 col = tex2D(_MainTex, i.uv);
//				// just invert the colors
//				col = 1 - col;
//				return col;
//			}

			fixed4 frag(v2f v_out) : SV_Target
			{
				float c_x = 4*v_out.uv.x - 2;
				float c_y = 4*v_out.uv.y - 2;
				float x = c_x;
				float y = c_y;
				int i;
				float x_old;
				float y_old;
				for (i=0; i<_MyItr ; i++)
				{
					x_old = x; y_old = y;
					x = x_old*x_old - y_old*y_old;
					y = 2*x_old*y_old;
					x += c_x;
					y += c_y;
					if ((x*x + y*y)>2.0)
						return half4(i/_MyItr, i/_MyItr,0, 1.0);
				}
				return half4(0, 0, 0, 1.0);
			}
			ENDCG
		}
	}
}
