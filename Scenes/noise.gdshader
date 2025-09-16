shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	vec2 distortedUV = SCREEN_UV + texture(TEXTURE, UV).b * 0.1;
    COLOR = textureLod(screen_texture, distortedUV, 0.0);
}
