#version 150

uniform sampler2D texture;
uniform float intensity;

in vec2 texCoord;

out vec4 fragColor;

void main() {
    gl_FragDepth = gl_FragCoord.z - 0.00001 * gl_FragCoord.w;
    fragColor = texture(texture, texCoord);

    if(gl_FrontFacing)
        fragColor.a *= smoothstep(0., 1., (intensity - 2.) / 2.);
}