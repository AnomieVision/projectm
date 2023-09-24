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
ARTIFACTS="${ROOT}/docs/artifacts"

# ---------------------------------------------

# Clean artifact files
cleanArtifacts() {
    rm -rf ${ARTIFACTS}
    mkdir -p ${ARTIFACTS}
}

# Clean build files
cleanBuild() {
    rm -rf ${BUILD}
    mkdir -p ${BUILD}
}

# ---------------------------------------------

# Build: linux-x64
linux-x64() {
    cd ${BUILD}

    cmake \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
    -G "Unix Makefiles" \
    -DCMAKE_INSTALL_PREFIX="${ARTIFACTS}/projectm-linux-shared-latest" \
    ..

    make install
}

# Build: emscripten
emscripten() {
    cd ${BUILD}

    emcmake cmake \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
    -G "Unix Makefiles" \
    -DCMAKE_INSTALL_PREFIX="${ARTIFACTS}/projectm-emscripten-latest" \
    ..

    emmake make install
}

# ---------------------------------------------

main() {
    cleanArtifacts
    cleanBuild
    linux-x64
}

main