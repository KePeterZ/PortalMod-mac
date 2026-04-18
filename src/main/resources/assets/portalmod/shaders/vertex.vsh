#version 150

layout(location = 0) in vec4 position;
layout(location = 1) in vec2 texCoord0;

uniform mat4 modelViewProjection;
uniform int phase;

out vec2 texCoord;

void main() {
    vec4 outPos = modelViewProjection * position;
    gl_Position = outPos;
    texCoord = 1. - texCoord0.xy;
}