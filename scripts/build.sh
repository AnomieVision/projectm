#!/bin/bash
set -e
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
BUILD_TYPE="Release"
RELEASE="${ROOT}/release"

# ---------------------------------------------

# Clean release files
cleanRelease() {
    rm -rf ${RELEASE}
    mkdir -p ${RELEASE}
}

# Clean build files
cleanBuild() {
    rm -rf ${BUILD}
    mkdir -p ${BUILD}
}

checkBuildDetails() {
    echo
    echo "-----------------------------------------"
    echo "Build Results"
    echo "-----------------------------------------"
    cd ${RELEASE}/linux-x32-multithreaded/lib

    echo
    echo "Build: linux-x32-multithreaded"
    echo
    file libprojectM.a
    file libprojectM.so
    file libprojectM.so.4
    file libprojectM.so.4.0.0

    cd ${RELEASE}/linux-x64-multithreaded/lib

    echo
    echo "Build: linux-x64-multithreaded"
    echo
    file libprojectM.a
    file libprojectM.so
    file libprojectM.so.4
    file libprojectM.so.4.0.0

    cd ${RELEASE}/emscripten-x32/lib

    echo
    echo "Build: emscripten-x32"
    echo
    file libprojectM.a
}

# ---------------------------------------------

# Build: linux-x32-multithreaded
linux-x32-multithreaded() {
    cd ${BUILD}

    cmake \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
    -G "Unix Makefiles" \
    -DCMAKE_TOOLCHAIN_FILE="./toolchains/linux-x32.cmake" \
    -DCMAKE_INSTALL_PREFIX="${RELEASE}/linux-x32-multithreaded" \
    ..

    make install
}

# Build: linux-x64-multithreaded
linux-x64-multithreaded() {
    cd ${BUILD}

    cmake \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
    -G "Unix Makefiles" \
    -DCMAKE_INSTALL_PREFIX="${RELEASE}/linux-x64-multithreaded" \
    ..

    make install
}

# Build: emscripten
emscripten() {
    cd ${BUILD}

    emcmake cmake \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
    -G "Unix Makefiles" \
    -DCMAKE_INSTALL_PREFIX="${RELEASE}/emscripten" \
    ..

    emmake make install
}

# ---------------------------------------------

main() {
    cleanRelease
    # cleanBuild
    # linux-x32-multithreaded
    cleanBuild
    linux-x64-multithreaded
    cleanBuild
    emscripten
    checkBuildDetails
}

main