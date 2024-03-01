#!/bin/bash
set -e

# ------------
# FUNCTIONS

# Prompt user to clean previous build files
prompt_clean_build() {
    AUTO="$1"
    BUILD="$2"
    DIST="$3"
    
    # Clean up previous build files, if found
    if [ -d "$BUILD" ] || [ -d "$DIST" ]; then
        if [ $AUTO = false ]; then
            echo
            echo -n "Clean up previous build files? (Y/n): "
            read -r clean
        else
            CLEAN="Y"
        fi
        
        if [[ "$CLEAN" != "N" && "$CLEAN" != "n" ]]; then
            if [ -d "$BUILD" ]; then
                rm -rf "$BUILD"
            fi
            
            if [ -d "$DIST" ]; then
                rm -rf "$DIST"
            fi
        fi
    fi
    
    # Create build and dist directories, if they don't exist
    if [ ! -d "$BUILD" ] ; then
        mkdir -p "$BUILD"
    fi
    
    if [ ! -d "$DIST" ] ; then
        mkdir -p "$DIST"
    fi
}

# Configure build
configure_build() {
    SOURCE="$1"
    BUILD="$2"
    DIST="$3"
    TARGET="$4"
    TYPE="$5"
    PTHREADS="$6"
    
    if [ "$TYPE" = "Release" ] ; then
        _DIST="$DIST/release"
    else
        _DIST="$DIST/debug"
    fi

    if [ "$TARGET" = "Emscripten" ] ; then
        if [ $PTHREADS = true ] ; then
            ENABLE_PTHREADS=ON
        else
            ENABLE_PTHREADS=OFF
        fi
    else 
        ENABLE_PTHREADS=OFF
    fi
    
    if [ "$TARGET" = "Emscripten" ] ; then
        if [ ! $EMSDK ] ; then
            echo "EMSDK environment variable not set"
            exit 1
        fi

        emcmake cmake \
        -G "Ninja" \
        -S "$SOURCE" \
        -B "$BUILD" \
        -DCMAKE_INSTALL_PREFIX=$_DIST \
        -DCMAKE_BUILD_TYPE=$TYPE \
        -DUSE_PTHREADS=$ENABLE_PTHREADS \
        -DCMAKE_VERBOSE_MAKEFILE=YES
    elif [ "$TARGET" = "X64" ] ; then
        cmake \
        -G "Ninja" \
        -S "$SOURCE" \
        -B "$BUILD" \
        -DCMAKE_INSTALL_PREFIX=$_DIST \
        -DCMAKE_BUILD_TYPE=$TYPE \
        -DCMAKE_VERBOSE_MAKEFILE=YES \
        -DBUILD_SHARED_LIBS=YES \
        -DBUILD_TESTING=NO
    fi
}

# Build project
build() {
    BUILD="$1"
    
    cmake --build "$BUILD" --target install --parallel
}

# ------------
# Main

AUTO=false
BUILD_DEBUG=true
BUILD_RELEASE=false
BUILD_TARGET="X64"
OPTION_PTHREADS=false

# Process command line arguments
while [[ $# -gt 0 ]]; do
    ARG="$1"
    
    case $ARG in
        -a|--auto)
        AUTO=true
        shift
        ;;
        -b|--both)
        BUILD_DEBUG=true
        BUILD_RELEASE=true
        shift
        ;;
        -e|--emscripten)
        BUILD_TARGET="Emscripten"
        shift
        ;;
        -p|--pthreads)
        OPTION_PTHREADS=true
        shift
        ;;
        -r|--release)
        BUILD_DEBUG=false
        BUILD_RELEASE=true
        shift
        ;;
        *)
        echo "Invalid argument: $ARG"
        exit 1
        ;;
    esac
done

# Checks
if [ ! $BUILD_TARGET = "Emscripten" ] && [ $OPTION_PTHREADS = true ] ; then
    echo "Option 'pthreads' is only available for Emscripten builds"
    exit 1
fi


# Set current directory
ROOT="$(pwd)"
BUILD="$ROOT/build"
DIST="$ROOT/dist"

prompt_clean_build "$AUTO" "$BUILD" "$DIST"

if [ $BUILD_DEBUG = true ] ; then
    configure_build "$ROOT" "$BUILD" "$DIST" "$BUILD_TARGET" "Debug" "$OPTION_PTHREADS"
    build "$BUILD"
fi

if [ $BUILD_RELEASE = true ] ; then
    configure_build "$ROOT" "$BUILD" "$DIST" "$BUILD_TARGET" "Release" "$OPTION_PTHREADS"
    build "$BUILD"
fi