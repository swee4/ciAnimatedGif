if(NOT TARGET ciAnimatedGif)
    # Define ${Cinder-Notifications_PROJECT_ROOT}. ${CMAKE_CURRENT_LIST_DIR} is just the current directory.
    get_filename_component(ciAnimatedGif_PROJECT_ROOT "${D:\save cave\CS stuff i think\CS 126\Cinder\blocks\ciAnimatedGif}/../.." ABSOLUTE)

    # Define ${CINDER_PATH} as usual.
    get_filename_component(CINDER_PATH "${ciAnimatedGif_PROJECT_ROOT}/../.." ABSOLUTE)

    # Make a list of source files and define that to be ${SOURCE_LIST}.
    file(GLOB SOURCE_LIST CONFIGURE_DEPENDS
            "${ciAnimatedGif_PROJECT_ROOT}/src/**/*.h"
            "${ciAnimatedGif_PROJECT_ROOT}/src/**/*.hpp"
            "${ciAnimatedGif_PROJECT_ROOT}/src/**/*.cc"
            "${ciAnimatedGif_PROJECT_ROOT}/src/**/*.cpp"
            "${ciAnimatedGif_PROJECT_ROOT}/src/**/*.c"
            "${ciAnimatedGif_PROJECT_ROOT}/src/*.h"
            "${ciAnimatedGif_PROJECT_ROOT}/src/*.hpp"
            "${ciAnimatedGif_PROJECT_ROOT}/src/*.cc"
            "${ciAnimatedGif_PROJECT_ROOT}/src/*.cpp"
            "${ciAnimatedGif_PROJECT_ROOT}/src/*.c")

    # Create the library!
    add_library(ciAnimatedGif ${SOURCE_LIST})

    # Add include directories.
    # Notice that `cinderblock.xml` has `<includePath>src</includePath>`.
    # So you need to set `../../src/` to include.
    target_include_directories(ciAnimatedGif PUBLIC "${Cinder-Notifications_PROJECT_ROOT}/src" )
    target_include_directories(ciAnimatedGif SYSTEM BEFORE PUBLIC "${CINDER_PATH}/include" )


    # If your Cinder block has no source code but instead pre-build libraries,
    # you can specify all of them here (uncomment the below line and adjust to your needs).
    # Make sure to use the libraries for the right platform.
    # # target_link_libraries(Cinder-Notifications "${Cinder-OpenCV_PROJECT_ROOT}/lib/libopencv_core.a")

    if(NOT TARGET cinder)
        include("${D:\save cave\CS stuff i think\CS 126\Cinder\blocks\ciAnimatedGif}/proj/cmake/configure.cmake")
        find_package(cinder REQUIRED PATHS
                "${D:\save cave\CS stuff i think\CS 126\Cinder\blocks\ciAnimatedGif}/${CINDER_LIB_DIRECTORY}"
                "$ENV{D:\save cave\CS stuff i think\CS 126\Cinder\blocks\ciAnimatedGif}/${CINDER_LIB_DIRECTORY}")
    endif()
    target_link_libraries(ciAnimatedGif PRIVATE cinder)

endif()