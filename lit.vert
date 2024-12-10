#version 330 core

// Positions/Coordinates
layout (location = 0) in vec3 aPos;
// Colors
layout (location = 1) in vec3 aColor;


// Outputs the color for the Fragment Shader
out vec3 vColor;
// Outputs the current position for the Fragment Shader
out vec3 vWorldPos;

// Imports the camera matrix from the main function
uniform mat4 camMatrix;
// Imports the model matrix from the main function
uniform mat4 model;


void main()
{
	// calculates world position
	vWorldPos = vec3(model * vec4(aPos, 1.0f));
	// Outputs the local pos of vertex
	gl_Position = camMatrix * vec4(vWorldPos, 1.0);

	// Assigns the colors from the Vertex Data to "color"
	vColor = aColor;
}