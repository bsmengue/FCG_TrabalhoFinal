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
    gl_Position = projection * view * model * model_coefficients;

    position_world = model * model_coefficients;
    position_model = model_coefficients;

    normal = inverse(transpose(model)) * normal_coefficients;
    normal.w = 0.0;

        texcoords = texture_coefficients;

    if (object_id == PLANE)
    {
        if (texture_id == 0)
        {
            texcoords = texture_coefficients;
        }
        else if (texture_id == 1)
        {
            texcoords = vec2(position_world.x, position_world.z) * 2.0;
        }
    }
    else if (object_id == 20) // CHECKPOINT (círculo 2D)
    {
        // model_coefficients.xy é o disco no plano, com raio ~1.2
        float r = 1.2;
        vec2 local = model_coefficients.xy;

        // mapeia [-r, r] -> [0,1] para U,V
        texcoords = local / (2.0 * r) + vec2(0.5, 0.5);
    }



    vec4 light_dir = normalize(vec4(1,1,0,0));

    vec3 N = normalize((inverse(transpose(model)) * normal_coefficients).xyz);

    float lambert = max(0, dot(N, light_dir.xyz));

    float ambient = 0.02;

    gouraud_color = vec3(lambert + ambient);

}
