#version 330 core

// Inputs
layout (location = 0) in vec4 model_coefficients;
layout (location = 1) in vec4 normal_coefficients;
layout (location = 2) in vec2 texture_coefficients;

// Uniforms
uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform int object_id;
uniform int texture_id;

// Object constants
#define SPHERE     0
#define CAR        1
#define PLANE      2
#define CHARIZARD  3
#define BULBASAUR  4

// Outputs
out vec4 position_world;
out vec4 position_model;
out vec4 normal;
out vec2 texcoords;
out vec3 gouraud_color;

void main()
{
    // posição final
    gl_Position = projection * view * model * model_coefficients;

    // interpolação
    position_world = model * model_coefficients;
    position_model = model_coefficients;

    normal = inverse(transpose(model)) * normal_coefficients;
    normal.w = 0.0;

    texcoords = texture_coefficients;

    // --- Mapeamento UV especial para PLANE ---
    if (object_id == PLANE)
    {
        if (texture_id == 0)
        {
            // chão grande – usa UV normal
            texcoords = texture_coefficients;
        }
        else if (texture_id == 1)
        {
            // chão menor – UV baseado na posição real
            texcoords = vec2(position_world.x, position_world.z) * 2.0;
        }
    }

    // Direção da luz (mesma usada no fragment shader)
    vec4 light_dir = normalize(vec4(1,1,0,0));

    // Normal já transformada e normalizada
    vec3 N = normalize((inverse(transpose(model)) * normal_coefficients).xyz);

    // Cálculo difuso simplificado
    float lambert = max(0, dot(N, light_dir.xyz));

    // Termo ambiente
    float ambient = 0.02;

    // Cor base (Kd) – textura será aplicada no fragment shader
    // Aqui enviamos apenas a intensidade da luz
    gouraud_color = vec3(lambert + ambient);

}
