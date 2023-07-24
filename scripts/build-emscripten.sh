#!/bin/bash
set -e

# Global variables
ROOT=$(pwd)
BUILD="${ROOT}/build"
BUILD_TYPE="Debug"
DIST="${ROOT}/dist"
LIBPROJECTM_DIR="${ROOT}/vendor/projectm/lib/cmake/libprojectM"

# ---------------------------------------------

# Clean dist files
clean_dist() {
    rm -rf ${DIST}
    mkdir -p ${DIST}
}

# Clean build files
clean_build() {
    rm -rf ${BUILD}
    mkdir -p ${BUILD}
}

# ---------------------------------------------

# Build: emscripten_no_playlist
build_emscripten_no_playlist() {
    emcmake cmake \
    -G "Unix Makefiles" \
    -S "${ROOT}" \
    -B "${BUILD}" \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
    -DCMAKE_INSTALL_PREFIX="${DIST}/emscripten_no_playlist" \
    -DCMAKE_VERBOSE_MAKEFILE=YES \
    -DENABLE_PLAYLIST=OFF

    cd $BUILD
    emmake make install

    cd $ROOT
}

# Build: emscripten_with_playlist
build_emscripten_with_playlist() {
    emcmake cmake \
    -G "Unix Makefiles" \
    -S "${ROOT}" \
    -B "${BUILD}" \
    -DCMAKE_BUILD_TYPE=${BUILD_TYPE} \
    -DCMAKE_INSTALL_PREFIX="${DIST}/emscripten_with_playlist" \
    -DCMAKE_VERBOSE_MAKEFILE=YES

    cd $BUILD
    emmake make install
    
    cd $ROOT
}

# ---------------------------------------------

main() {
    clean_dist
    clean_build
    build_emscripten_no_playlist
    clean_build
    build_emscripten_with_playlist
}

main