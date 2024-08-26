cmake_minimum_required(VERSION 3.30)

project(mRTpp)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Vulkan REQUIRED)
find_package(glfw3 3.3 REQUIRED)
find_package(glm REQUIRED)

set(HPP_FILES
	src/window.hpp)

set(SRC_FILES
	src/main.cpp
	src/window.cpp)

add_executable(${PROJECT_NAME} ${SRC_FILES} ${HPP_FILES})

target_include_directories(${PROJECT_NAME} PRIVATE src/)
target_include_directories(${PROJECT_NAME} PRIVATE ${Vulkan_INCLUDE_DIRS})
target_include_directories(${PROJECT_NAME} PRIVATE ${GLFW_INCLUDE_DIRS})
target_include_directories(${PROJECT_NAME} PRIVATE ${GLM_INCLUDE_DIRS})

target_link_libraries(${PROJECT_NAME} ${Vulkan_LIBRARIES} glfw glm::glm)
