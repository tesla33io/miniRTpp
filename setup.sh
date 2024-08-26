#!/bin/bash

set -e

INST_VULKAN_MSG="\033[32;3m===::: Installing Vulkan :::===\033[0m"
INST_GLFW_MSG="\033[32;3m===::: Installing Vulkan :::===\033[0m"
INST_GLM_MSG="\033[32;3m===::: Installing Vulkan :::===\033[0m"
FINISH_MSG="\n\n\033[35;3mIf you don't see a window with a spinning cube inside, \
that means that something went wrong during installation.\033[0m\n\n"

# Function to install Vulkan on Ubuntu/Debian-based distributions
install_vulkan_debian() {
    echo -e $INST_VULKAN_MSG
    sudo apt update
    sudo apt install -y vulkan-tools libvulkan-dev vulkan-utility-libraries-dev spirv-tools
	echo -e $INST_GLFW_MSG
	sudo apt install libglfw3-dev
	echo -e $INST_GLM_MSG
	sudo apt install libglm-dev
}

# Function to install Vulkan on Fedora-based distributions
install_vulkan_fedora() {
    echo -e $INST_VULKAN_MSG
    sudo dnf install -y vulkan-tools vulkan-loader-devel mesa-vulkan-devel vulkan-validation-layers-devel
	echo -e $INST_GLFW_MSG
	sudo dnf install glfw-devel
	echo -e $INST_GLM_MSG
	sudo dnf install glm-devel
}

# Function to install Vulkan on Arch-based distributions
install_vulkan_arch() {
    echo -e $INST_VULKAN_MSG
    sudo pacman -S vulkan-devel
	echo -e $INST_GLFW_MSG
	if [ XDG_SESSION_TYPE == "wayland" ]; then
		sudo pacman -S glfw-wayland
	else
		sudo pacman -S glfw-x11
	fi
	echo -e $INST_GLM_MSG
	sudo pacman -S glm
}

# Detect the operating system and distribution
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        case "$ID" in
            ubuntu|debian)
                install_vulkan_debian
                ;;
            fedora)
                install_vulkan_fedora
                ;;
            arch|manjaro)
                install_vulkan_arch
                ;;
            *)
                echo "Unsupported Linux distribution: $ID"
                exit 1
                ;;
        esac
    else
        echo "Cannot determine Linux distribution."
        exit 1
    fi
else
    echo "Unsupported OS: $OSTYPE"
    exit 1
fi

echo -e $FINISH_MSG
vkcube
echo "Vulkan installation completed."
