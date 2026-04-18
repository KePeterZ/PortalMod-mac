#version 150

layout(location = 0) in vec4 position;

uniform mat4 modelViewProjection;

out vec2 coords;

void main() {
    vec4 pos = (modelViewProjection * position);
    coords = pos.xy;
    gl_Position = pos;
}