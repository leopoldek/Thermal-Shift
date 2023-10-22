shader_type canvas_item;
render_mode unshaded;

// REFACTOR LATER
// It's possible to have dynamic conduction by making the conduction texture
// another viewport and rendering shapes there but ehh
uniform sampler2D conduction;
//uniform vec2 wind = vec2(0, -1);
uniform float delta;

void fragment(){
	vec3 center = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0).rgb;
	vec2 wind = center.gb * 2.0 - 1.0;
	
	// Perhaps use blurred screen texture instead?
	float up     = textureLod(SCREEN_TEXTURE, SCREEN_UV + vec2(0, SCREEN_PIXEL_SIZE.y), 0).r;
	float left   = textureLod(SCREEN_TEXTURE, SCREEN_UV + vec2(-SCREEN_PIXEL_SIZE.x, 0), 0).r;
	float right  = textureLod(SCREEN_TEXTURE, SCREEN_UV + vec2(SCREEN_PIXEL_SIZE.x, 0), 0).r;
	float down   = textureLod(SCREEN_TEXTURE, SCREEN_UV + vec2(0, -SCREEN_PIXEL_SIZE.y), 0).r;
	
	up *= 1.0 + wind.y;
	down *= 1.0 - wind.y;
	left *= 1.0 + wind.x;
	right *= 1.0 - wind.x;
	
	float conduct = texture(conduction, SCREEN_UV).r;
	// Can't use alpha cause Godot doesn't support changing the alpha blend mode
	//float conduct = center.a;
	
	float multiplier = 1.0 - min(1.0, delta * 0.3);
	
	float heat = center.r * (1.0 - conduct) + (center.r + up + left + right + down) * conduct * 0.2;
	heat -= 0.5;
	heat *= multiplier; // Use this if you don't want to take conductivity into account
	//heat = heat * multiplier * conduct + heat * (1.0 - conduct);
	heat += 0.5;
	
	wind *= multiplier;
	wind = wind * 0.5 + 0.5;
	
	COLOR = vec4(heat, wind, 1);
}