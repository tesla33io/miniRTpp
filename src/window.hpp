#ifndef WINDOW_HPP
# define WINDOW_HPP

#include <string>

#define GLFW_INCLUDE_VULKAN
#include <GLFW/glfw3.h>

namespace win {
	class Window {

	public:
		Window():
			width(720),
			aspectRation(16.0/9.0),
			height(width/aspectRation),
			windowName("/o_o\\\\") {
				windowInit();
			};
		Window(int w, double ar, std::string name):
			width(w),
			aspectRation(ar),
			height(width/aspectRation),
			windowName(name) {
				windowInit();
			};
		~Window() {
			glfwDestroyWindow(window);
			glfwTerminate();
		};

	private:
		void				windowInit();
		const int			width;
		const double		aspectRation;
		const int			height;
		const std::string	windowName;

		GLFWwindow	*window;
	};
}

#endif /* WINDOW_HPP */
