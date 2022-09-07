#include <iostream>

#define STB_IMAGE_IMPLEMENTATION
#include "vendor/stb/stb_image.h"

#define STB_VOXEL_RENDER_IMPLEMENTATION
#define STBVOX_CONFIG_MODE 0
#include "vendor/stb/stb_voxel_render.h"

int main()
{
    std::cout << "Hello World!" << std::endl;
    return 0;
}