// Bitmap to ASCII (not really) fragment shader by movAX13h, September 2013
// This is the original shader that is now used in PixiJs ans various other products.

// Here's a little tool for new characters: thrill-project.com/archiv/coding/bitmap/

// from ShaderToy https://www.shadertoy.com/view/lssGDj

uniform vec2 iResolution;
uniform sampler2D texture;

#define iChannel0 texture

float character(float n, vec2 p)
{
	p = floor(p*vec2(4.0, -4.0) + 2.5);
	if (clamp(p.x, 0.0, 4.0) == p.x && clamp(p.y, 0.0, 4.0) == p.y)
	{
		if (int(mod(n/exp2(p.x + 5.0*p.y), 2.0)) == 1) return 1.0;
	}
	return 0.0;
}

void main() {

    vec2 uv = gl_FragCoord.xy;      //tam ventana
    vec3 col =texture2D(texture, floor(uv/8.0)*8.0/iResolution.xy).xyz;
    float luma = 0.299 * col.r + 0.587 * col.g + 0.114 * col.b;

    float n =  4096.0;              // .
	if (luma > 0.2) n = 65600.0;    // :
	if (luma > 0.3) n = 332772.0;   // *
	if (luma > 0.4) n = 15255086.0; // o
	if (luma > 0.5) n = 23385164.0; // &
	if (luma > 0.6) n = 15252014.0; // 8
	if (luma > 0.7) n = 13199452.0; // @
	if (luma > 0.8) n = 11512810.0; // #

	vec2 p = mod(uv/4.0, 2.0) - vec2(1.0);
	vec3 _out = luma*vec3(character(n, p));

	gl_FragColor = vec4(_out, 1.0);
}

