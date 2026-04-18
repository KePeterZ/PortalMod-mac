#version 150

uniform sampler2D texture;

in vec2 texCoord;

out vec4 fragColor;

void main() {
    fragColor = texture(texture, texCoord);

    if(gl_FragCoord.z < .95) {
        gl_FragDepth = gl_FragCoord.z * 0.99;
    } else if(gl_FragCoord.z < .99) {
        gl_FragDepth = gl_FragCoord.z - 0.0001;
    } else {
        gl_FragDepth = gl_FragCoord.z;
    }
}