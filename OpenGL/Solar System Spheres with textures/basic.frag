#version 330 core
out vec4 FragColor;

in vec2 text;

uniform sampler2D textura1;
//uniform sampler2D glGetUniformLocation , glUniform1i, variabila_textura

void main()
{
    //FragColor = vec4(0.0f, 0.0f, 0.0f, 0.5f);
    FragColor = texture(textura1, text);
}












/*#version 330 core
out vec4 FragColor;

in vec2 TexCoords;

uniform sampler2D texture_diffuse1;

void main()
{
    FragColor = texture(texture_diffuse1 ,TexCoord);
}
*/
