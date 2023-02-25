#version 330 core
layout (location = 0) in vec3 vertexPos;
layout (location = 1) in vec2 TexCoords1;

out vec2 text;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
void main()
{
    gl_Position = projection*view*model*vec4(vertexPos, 1.0);
    text = TexCoords1;
}









/*#version 330 core
layout (location = 0) in vec3 vertexPos;
out vec2 TexCoords;
uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
void main()
{
    gl_Position = projection*view*model*vec4(vertexPos, 1.0);
    TexCoords=vec2(vertexPos);
}
*/
