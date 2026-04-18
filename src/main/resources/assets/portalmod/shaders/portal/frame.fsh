#version 150

uniform sampler2D texture;
uniform int frameCount;
uniform int frameIndex;

in vec2 texCoord;

out vec4 fragColor;

void main() {
    vec2 uv = texCoord;
    uv.y /= float(frameCount);
    uv.x = 1. - uv.x;

    uv.y += float(frameIndex) / float(frameCount);
    fragColor = texture(texture, uv);
}