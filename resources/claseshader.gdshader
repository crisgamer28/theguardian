shader_type canvas_item;

uniform vec4 color : source_color;


void fragment() {
	vec4 pixelColor = texture(TEXTURE, UV);
	float brillo = (pixelColor.r + pixelColor.g + pixelColor.b)/3.0;
	vec4 grey_scale = vec4(brillo, brillo, brillo, pixelColor.a);
	COLOR = grey_scale * color;
}

