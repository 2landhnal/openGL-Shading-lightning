#version 330 core

layout(triangles) in;  // triangle in
layout(triangle_strip, max_vertices = 3) out; // triangle out

in vec3 vColor[];  // get color from vertex shader
in vec3 vWorldPos[];   // vWorldPos

out vec3 gColor; // export color to frag
out vec3 gNormal;    // export normal to frag
out vec3 gWorldPos;   // vWorldPos

uniform mat4 model;

void main() {
    // triangle's vertex 
    vec3 v0 = vWorldPos[0];
    vec3 v1 = vWorldPos[1];
    vec3 v2 = vWorldPos[2];

    // calc normal 
    vec3 edge1 = v1 - v0;
    vec3 edge2 = v2 - v0;
    vec3 computedNormal = -normalize(cross(edge1, edge2));

    // export to next layer
    for (int i = 0; i < 3; i++) {
        gColor = vColor[i];                // color
        gWorldPos = vWorldPos[i];  //  vWorldPos
        gNormal = computedNormal;             // Normal
        gl_Position = gl_in[i].gl_Position;  // local Pos
        EmitVertex();                        // export 
    }
    EndPrimitive();
}
