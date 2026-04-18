#version 150

uniform sampler2D texture;

in vec2 coords;
out vec4 color;

void main() {
    color = texture(texture, coords);
}