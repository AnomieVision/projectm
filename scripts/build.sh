#!/bin/bash
#-------------------------------------------------------------------------------------------------------------
# ProjectM | https://github.com/projectM-visualizer/projectm
#   -- Download repository source
#   -- Build libProjectM
#   -- Install libProjectM
#-------------------------------------------------------------------------------------------------------------
# Version
VERSION="3.9.9"
REPO="https://github.com/projectM-visualizer/projectm.git"

# Global variables
ROOT=$(pwd)
SRC="${ROOT}/src"
BUILD="${ROOT}/build"
BUILD_TYPE="RELEASE"
EMSDK_TOOLCHAIN_FILE="$HOME/install/emsdk/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake"
INSTALL_PREFIX="$HOME/install/projectm"
PREFIX_PATH="$INSTALL_PREFIX"

# Clean generated project files
cleanProject() {
    rm -rf ${BUILD}
}

# Build
buildProject() {
    emcmake cmake \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
    -G "Unix Makefiles" \
    -DCMAKE_TOOLCHAIN_FILE=${EMSDK_TOOLCHAIN_FILE} \
    -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} \
    -DCMAKE_PREFIX_PATH=${PREFIX_PATH} \
    -B ${BUILD} \
    -S .

    cd $BUILD
    emmake make install
}

cleanProject
buildProject