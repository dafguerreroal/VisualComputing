#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

varying vec4 vertColor;
varying vec4 vertTexCoord;

void main() {    
    vec2 tc = vertTexCoord.st;
    vec4 color = texture2D(texture, tc);
	//float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
    float gray = (color.r+color.g+color.b)/3;
	gl_FragColor = vec4(vec3(gray), 1.0);
}