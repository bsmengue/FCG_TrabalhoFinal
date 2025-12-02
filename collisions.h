#ifndef COLLISIONS_H
#define COLLISIONS_H

#include <glm/glm.hpp>

bool AABBvsAABB(const glm::vec3& minA, const glm::vec3& maxA,
                const glm::vec3& minB, const glm::vec3& maxB);

void ComputeWorldAABB(const glm::vec3& localMin,
                      const glm::vec3& localMax,
                      const glm::mat4& model,
                      glm::vec3& outMin,
                      glm::vec3& outMax);

#endif
