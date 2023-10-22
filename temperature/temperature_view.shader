shader_type canvas_item;
render_mode blend_mix;

uniform sampler2D gradient;

void fragment(){
	float heat = texture(TEXTURE, UV).r;
	COLOR = texture(gradient, vec2(heat, 0));
	COLOR.a *= 0.5;
	//COLOR = vec4(1, COLOR.gb, 1);
}