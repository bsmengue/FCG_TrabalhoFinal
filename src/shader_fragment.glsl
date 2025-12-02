#version 330 core

// ==== OBJETO IDs (necessário no fragment shader!) ====
#define SPHERE     0
#define CAR        1
#define PLANE      2
#define CHARIZARD  3
#define BULBASAUR  4
#define TREE 5

in vec4 position_world;
in vec4 normal;
in vec4 position_model;
in vec2 texcoords;
in vec3 gouraud_color;


uniform mat4 view;

uniform int object_id;
uniform int texture_id;

// Textures
uniform sampler2D TextureImage0;
uniform sampler2D TextureImage1;
uniform sampler2D TextureImage2;
uniform sampler2D TextureImage3;
uniform sampler2D TextureImage4;
uniform sampler2D TextureImage5;
uniform sampler2D TextureImage6;
uniform sampler2D TextureImage7;
uniform sampler2D TextureImage8;

uniform vec4 bbox_min;
uniform vec4 bbox_max;

out vec4 color;

void main()
{
    vec4 cam_pos = inverse(view) * vec4(0,0,0,1);

    vec4 p = position_world;
    vec4 n = normalize(normal);

    float U = texcoords.x;
    float V = texcoords.y;

    vec3 Kd0 = vec3(1.0);

    if (object_id == PLANE)
    {
        if (texture_id == 0)
            Kd0 = texture(TextureImage2, vec2(U,V)).rgb;

        else if (texture_id == 1)
            Kd0 = texture(TextureImage6, vec2(U,V)).rgb;
    }
    else if (object_id == SPHERE)
    {
        Kd0 = texture(TextureImage4, vec2(U,V)).rgb;
        color = vec4(Kd0, 1);
        return;
    }
else if (object_id == CAR)
{
    vec3 base = texture(TextureImage7, vec2(U,V)).rgb;

    // Usa iluminação Gouraud (interpolada do vertex shader)
    vec3 result = base * gouraud_color;

    color = vec4(pow(result, vec3(1.0/2.2)), 1.0);
    return;
}

    else if (object_id == CHARIZARD)
    {
        vec3 base = texture(TextureImage3, vec2(U,V)).rgb;
        vec3 result = base * gouraud_color;   // <- luz já interpolada do VS
        color = vec4(pow(result, vec3(1.0/2.2)), 1.0);
        return;
    }


    else if (object_id == BULBASAUR)
            {
        vec3 base = texture(TextureImage5, vec2(U,V)).rgb;
        vec3 result = base * gouraud_color;   // <- luz já interpolada do VS
        color = vec4(pow(result, vec3(1.0/2.2)), 1.0);
        return;
    }

    else if (object_id == TREE)
        {
        vec3 base = texture(TextureImage8, vec2(U,V)).rgb;
        vec3 result = base * gouraud_color;   // <- luz já interpolada do VS
        color = vec4(pow(result, vec3(1.0/2.2)), 1.0);
        return;
    }

    else if (object_id == 20)  // CHECKPOINT
{
    color = vec4(1.0, 1.0, 0.0, 1.0);

}
else if (object_id == 21) // FINISH LINE
{
    color = vec4(0.0, 1.0, 0.0, 1.0);
}



    float lambert = max(0, dot(n, normalize(vec4(1,1,0,0))));
    vec3 result = Kd0 * (lambert + 0.02);

    color = vec4(pow(result, vec3(1.0/2.2)), 1.0);
}
