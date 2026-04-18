#version 150

layout(location = 0) in vec4 position;
layout(location = 1) in vec2 texCoord0;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform int clipPlaneEnabled;
uniform vec3 clipVec;
uniform vec3 clipPos;

out vec2 texCoord;

void main() {
    vec4 worldPos = model * position;
    vec4 outPos = projection * (view * worldPos);
    texCoord = 1. - texCoord0.xy;

    gl_Position = outPos;
    gl_ClipDistance[0] = (clipPlaneEnabled != 0) ? dot(worldPos.xyz - clipPos, clipVec) : 1.;
}