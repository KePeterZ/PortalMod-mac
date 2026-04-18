#version 150

layout(location = 0) in vec4 position;
layout(location = 1) in vec2 texCoord0;

uniform mat4 projection;

out vec2 texCoord;

void main() {
    gl_Position = projection * position;
    texCoord = 1. - texCoord0.xy;
}