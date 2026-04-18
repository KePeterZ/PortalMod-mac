#version 150

uniform mat4 modelView;
uniform mat4 projection;

layout(location = 0) in vec3 position;
layout(location = 1) in vec2 texCoord0;

out vec2 coords;

void main() {
    vec4 pos = projection * modelView * vec4(position, 1);
    coords = texCoord0.xy;
    gl_Position = pos;
}