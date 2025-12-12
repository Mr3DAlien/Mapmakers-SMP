#version 150
#moj_import <fog.glsl>

uniform sampler2D Sampler0;
uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

void main() {
    vec4 c = texture(Sampler0, texCoord0) * vertexColor * ColorModulator;
    if (c.a < 0.1) discard;
    if (int(c.a * 255.0 + 0.5) == 254) c = texture(Sampler0, texCoord0);
    fragColor = linear_fog(c, vertexDistance, FogStart, FogEnd, FogColor);
}