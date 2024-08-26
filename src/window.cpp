#include "window.hpp"
#include <GLFW/glfw3.h>

namespace win {

void Window::windowInit() {
	glfwInit();
	glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);

	window = glfwCreateWindow(width, height, windowName.c_str(), nullptr, nullptr);
}

};
