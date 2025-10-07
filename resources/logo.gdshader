shader_type canvas_item;

uniform vec4 color : source_color;
uniform float flash_state : hint_range(0.0, 1.0, 0.1);

void fragment() {
	vec4 pixelColor = texture(TEXTURE, UV);
	COLOR = mix(pixelColor, color, flash_state);
	COLOR.a *= pixelColor.a;

}

