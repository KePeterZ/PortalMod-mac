#version 150

uniform sampler2D texture;
uniform vec4 color;
uniform int phase;

in vec2 texCoord;

out vec4 fragColor;

void main() {
//    if(phase == 0 && texture(texture, texCoord).rgb == vec3(1, 1, 1))
//        discard;
//    fragColor = vec4(0, 1, texCoord.x, 1);
    fragColor = vec4(color.xyz, 1);

    if(phase == 0) {
        if(texture(texture, texCoord).rgb == vec3(1, 1, 1))
            discard;
        gl_FragDepth = gl_FragCoord.z;
//        fragColor = texture(texture, texCoord);
    } else if(phase == 1) {
        gl_FragDepth = 1.0;
    } else if(phase == 2) {
        gl_FragDepth = gl_FragCoord.z;
    } else if(phase == 3) {
        gl_FragDepth = gl_FragCoord.z - .0001;
    } else if(phase == 4) {
        gl_FragDepth = 0.0;
        fragColor = texture(texture, texCoord);
//        fragColor.a *= .8;
    } else if(phase == 5) {
        gl_FragDepth = gl_FragCoord.z;
        fragColor = texture(texture, texCoord);
    }
}

//if(phase == 0) {
//    if(texture(texture, texCoord).rgb == vec3(1, 1, 1))
//    discard;
//    gl_FragDepth = gl_FragCoord.z;
//    fragColor = vec4(0);
//} else if(phase == 1) {
//    gl_FragDepth = 1.0;
//    fragColor = vec4(color.xyz, 1);
//} else if(phase == 2) {
//    gl_FragDepth = gl_FragCoord.z;
//    fragColor = vec4(0);
//} else if(phase == 3) {
//    gl_FragDepth = 0.0;
//    fragColor = texture(texture, texCoord);
//}