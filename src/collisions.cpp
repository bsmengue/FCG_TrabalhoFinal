
#include "collisions.h"
#include <glm/glm.hpp>
#include <algorithm>


// -------------------------------------------------------------
// Função simples AABB vs AABB
// Retorna true se duas caixas axis-aligned se sobrepõem.
// -------------------------------------------------------------

bool AABBvsAABB(const glm::vec3& minA, const glm::vec3& maxA,
                const glm::vec3& minB, const glm::vec3& maxB)
{
    return (minA.x <= maxB.x && maxA.x >= minB.x) &&
           (minA.y <= maxB.y && maxA.y >= minB.y) &&
           (minA.z <= maxB.z && maxA.z >= minB.z);
}

// -------------------------------------------------------------
// Função que retorna a AABB de um objeto transformado no mundo
// Recebe bounding box original + matriz model do objeto
// -------------------------------------------------------------

void ComputeWorldAABB(const glm::vec3& localMin,
                      const glm::vec3& localMax,
                      const glm::mat4& model,
                      glm::vec3& outMin,
                      glm::vec3& outMax)
{
    glm::vec3 corners[8] = {
        {localMin.x, localMin.y, localMin.z},
        {localMin.x, localMin.y, localMax.z},
        {localMin.x, localMax.y, localMin.z},
        {localMin.x, localMax.y, localMax.z},
        {localMax.x, localMin.y, localMin.z},
        {localMax.x, localMin.y, localMax.z},
        {localMax.x, localMax.y, localMin.z},
        {localMax.x, localMax.y, localMax.z}
    };

    outMin = glm::vec3(999999.0f);
    outMax = glm::vec3(-999999.0f);

    for (int i = 0; i < 8; i++)
    {
        glm::vec4 p = model * glm::vec4(corners[i], 1.0f);
        outMin.x = std::min(outMin.x, p.x);
        outMin.y = std::min(outMin.y, p.y);
        outMin.z = std::min(outMin.z, p.z);

        outMax.x = std::max(outMax.x, p.x);
        outMax.y = std::max(outMax.y, p.y);
        outMax.z = std::max(outMax.z, p.z);
    }
}
