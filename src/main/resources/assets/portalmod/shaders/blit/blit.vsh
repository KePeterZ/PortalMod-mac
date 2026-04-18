#version 150

layout(location = 0) in vec3 position;
layout(location = 1) in vec2 texCoord0;

out vec2 coords;

void main() {
    coords = texCoord0.xy;
    gl_Position = vec4(position, 1.);
}