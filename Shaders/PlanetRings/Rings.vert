uniform mat4 unMVP;
uniform mat4 unM;
uniform float unOuterRadius;

// Attributes
in vec2 vPosition;

out vec3 fPosition;
out vec3 fWorldPosition;
out float fLogZ;

#include "Shaders/Utils/logz.glsl"

void main() {
    fWorldPosition = (unM * vec4(vPosition.x, 0.0, vPosition.y, 1.0)).xyz;
    fPosition = vec3(vPosition.x, 0.0, vPosition.y) * unOuterRadius;
    gl_Position = unMVP * vec4(vPosition.x, 0.0, vPosition.y, 1.0);
    applyLogZ();
    fLogZ = 1.0 + gl_Position.w;
}
