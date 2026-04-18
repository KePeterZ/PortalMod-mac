#version 150

//uniform vec4 color;

in vec2 coords;

out vec4 fragColor;

void main() {
//    if(length(coords) < 100.) {
//        fragColor = vec4(1, 1, 0, 1);
//        return;
//    }
//    
//    float alpha = (1. - pow(abs(coords.x), 20.)) * (1. - pow(abs(coords.y), 20.));
//    fragColor = vec4(1, 1, 1, alpha);
    fragColor = vec4(1, 1, 0, 1);
}