#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif
#define PROCESSING_COLOR_SHADER
uniform mat4 texMatrix;
uniform sampler2D texture ;
uniform sampler2D texture1 ;
vec2 iResolution =vec2(800,600);

varying vec4 vertColor;
varying vec4 vertTexCoord;

uniform int layer;

vec2 Circle(float Start, float Points, float Point)
{
	float Rad = (3.141592 * 2.0 * (1.0 / Points)) * (Point + Start);
	return vec2(sin(Rad), cos(Rad));
}






void main( ) {


vec2 uv= gl_FragCoord.xy/iResolution.xy;
uv.x= uv.x   ;
uv.y= -uv.y   ;
  vec2 PixelOffset = 1.0 / iResolution.xy/2;

  const float Radius = 10.0;
  float Start = 2.0 / Radius;
vec2 Scale = .196 * Radius * 2.0 * PixelOffset.xy;

  float W = 1.0 / (Radius + 1.0);

  vec3 color = vec3(0,0,0);

  for (float i=0.0;i<Radius; i++) {
 color.rgb += texture(texture , uv + Circle(Start, Radius, i) * Scale).rgb * W;
 //color= (vec3(rc,gc,bc)*vec3(20.2)+color);
  }

    vec3 TL = texture(texture, uv + vec2(-1, 1)/ iResolution.xy).rgb* W;
      vec3 TM = texture(texture, uv + vec2(0, 1)/ iResolution.xy).rgb* W;
      vec3 TR = texture(texture, uv + vec2(1, 1)/ iResolution.xy).rgb* W;

      vec3 ML = texture(texture, uv + vec2(-1, 0)/ iResolution.xy).rgb* W;
      vec3 MR = texture(texture, uv + vec2(1, 0)/ iResolution.xy).rgb* W;

      vec3 BL = texture(texture, uv + vec2(-1, -1)/ iResolution.xy).rgb* W;
      vec3 BM = texture(texture, uv + vec2(0, -1)/ iResolution.xy).rgb* W;
      vec3 BR = texture(texture, uv + vec2(1, -1)/ iResolution.xy).rgb* W;

      vec3 GradX = -TL + TR - 2.0 * ML + 2.0 * MR - BL + BR;
      vec3 GradY = TL + 2.0 * TM + TR - BL - 2.0 * BM - BR;


      float rc = length(vec2(GradX.r, GradY.r));
      float gc = length(vec2(GradX.g, GradY.g));
      float bc = length(vec2(GradX.b, GradY.b));

vec3 colorc = vec3(rc,gc,bc);
   vec4 TLd =  texelFetch(texture, ivec2(vertTexCoord.st), 1) ;
    vec3 pos = vertTexCoord.xyz;
  //gl_FragColor = texture(texture, uv  ) ;
 gl_FragColor =vec4(TLd.rgb,1.0);
//if (layer==1)   gl_FragColor = texture2D(texture1, vertTexCoord.st) * vertColor;
//if (layer==2)   gl_FragColor = texture2D(texture, vertTexCoord.st/iResolution.xy) ;//* vertColor;
//  gl_FragColor =vec4(dd,0.,0.,1.0);
//  gl_FragColor = vec4(color.rgb,1.0);
}
