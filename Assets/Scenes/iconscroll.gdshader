shader_type canvas_item;

uniform float speed = .1;

void vertex() {
	UV.y += TIME * speed;
}

void fragment() {
	// Called for every pixel the material is visible on.
}
