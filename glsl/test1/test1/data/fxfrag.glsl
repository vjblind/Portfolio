#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif
#define PROCESSING_TEXTURE_SHADER
uniform mat4 texMatrix;
uniform sampler2D texture ;
vec2 iResolution =vec2(800,600);

varying vec4 vertColor;
in vec4 vertTexCoord;

vec3 draw(vec2 uv) {
  return texture(texture,vec2(uv.x,1.-uv.y)).rgb;
  //return texture(iChannel0,uv).rgb;
}



float rand(vec2 co){
  return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void main( ) {
float bluramount = sin(222)*0.1;
    vec2 pixelSize=1.0/iResolution.xy;
      vec2 uv= gl_FragCoord.xy/iResolution.xy;
uv.x= uv.x   ;
uv.y= + 1.-uv.y   ;
      vec3 blurred_image = vec3(0.);
#define repeats 23.
for (float i = 0.; i < repeats; i++) {
 //Older:
 //vec2 q = vec2(cos(degrees((grid(i,dists)/repeats)*360.)),sin(degrees((grid(i,dists)/repeats)*360.))) * (1./(1.+mod(i,dists)));
 vec2 q = vec2(cos(degrees((i/repeats)*360.)),sin(degrees((i/repeats)*360.))) *  (rand(vec2(i,uv.x+uv.y))*.1+bluramount);
 vec2 uv2 = uv+(q*bluramount);
 blurred_image += draw(uv2)/2.;
 //One more to hide the noise.
 //q = vec2(cos(degrees((i/repeats)*360.)),sin(degrees((i/repeats)*360.))) *  (rand(vec2(i+2.,uv.x+uv.y+24.))+bluramount);
 //uv2 = uv+(q*bluramount);
 //blurred_image += draw(uv2)/2.;
}
blurred_image /= repeats;
       gl_FragColor = vec4(blurred_image,1.0)+texture(texture, vertTexCoord.st ).rgba;
}
