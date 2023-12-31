// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

#include "UnityCG.cginc"
uniform sampler2D _MainTex;uniform float4 _MainTex_ST;uniform half _Power;uniform half _InvFade;sampler2D _CameraDepthTexture;struct v2fB {half4 pos : SV_POSITION;half2 uv : TEXCOORD0;half4 uvScreen : TEXCOORD1;half4 color : COLOR0;half3 light : COLOR1;};v2fB vertB (appdata_full v){v2fB o;o.uv.xy = TRANSFORM_TEX(v.texcoord.xy, _MainTex);o.pos = UnityObjectToClipPos (v.vertex);o.uvScreen = ComputeGrabScreenPos (o.pos);
#ifdef SOFTPARTICLES_ON
COMPUTE_EYEDEPTH(o.uvScreen.z);
#endif
o.color = v.color;o.light = ShadeVertexLights(v.vertex, -v.normal) * _Power;return o;}