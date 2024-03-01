#!/bin/bash
set -e

# ------------
# FUNCTIONS:

# Install packages based on the selected package manager: apt, pacman, brew
install_packages() {
    local AUTO=$1
    local PACKAGE_MANAGER=$2
    local PACKAGE_LIST=("${!3}")
    
    case $PACKAGE_MANAGER in
        apt)
            sudo apt update
            
            if [ $AUTO = true ]; then
                sudo apt install -y "${PACKAGE_LIST[@]}"
            else
                sudo apt install "${PACKAGE_LIST[@]}"
            fi
        ;;
        pacman)
            sudo pacman -Syyu
            
            if [ $AUTO = true ]; then
                sudo pacman -Sy "${PACKAGE_LIST[@]}"
            else
                sudo pacman -S "${PACKAGE_LIST[@]}"
            fi
        ;;
        # brew)
        #     brew update
        
        #     if [ $AUTO = true ]; then
        #         brew install "${PACKAGE_LIST[@]}" || true
        #     else
        #         brew install "${PACKAGE_LIST[@]}"
        #     fi
        # ;;
    esac
}

# Prompt user to install dependencies, (and choose a package manager, if multiple are available)
prompt_install_dependencies() {
    local AUTO=$1
    
    # Check for available package managers
    AVAILABLE_PACKAGE_MANAGERS=()
    
    if [ "$(uname)" == "Darwin" ]; then
        if command -v brew &>/dev/null; then
            AVAILABLE_PACKAGE_MANAGERS+=("brew")
        fi
        elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        if command -v apt &>/dev/null; then
            AVAILABLE_PACKAGE_MANAGERS+=("apt")
        fi
        
        if command -v pacman &>/dev/null; then
            AVAILABLE_PACKAGE_MANAGERS+=("pacman")
        fi
    fi
    
    # Prompt user to choose a package manager
    if [ ${#AVAILABLE_PACKAGE_MANAGERS[@]} -eq 0 ]; then
        echo "No supported package managers found."
        exit 1
        elif [ ${#AVAILABLE_PACKAGE_MANAGERS[@]} -eq 1 ] || [ $AUTO = true ]; then
        SELECTED_PACKAGE_MANAGER=${AVAILABLE_PACKAGE_MANAGERS[0]}
    else
        echo -n "Multiple package managers found. Please choose one:"
        select SELECTED_PACKAGE_MANAGER in "${AVAILABLE_PACKAGE_MANAGERS[@]}"; do
            if [ -n "$SELECTED_PACKAGE_MANAGER" ]; then
                break
            else
                echo "Invalid selection. Please choose a number."
            fi
        done
    fi
    
    # Install packages based on the selected package manager
    case $SELECTED_PACKAGE_MANAGER in
        apt)
            PACKAGE_LIST=("git" "cmake" "ninja-build" "pkg-config" "build-essential" "libgl1-mesa-dev" "mesa-common-dev" "libglm-dev")
            install_packages $AUTO "$SELECTED_PACKAGE_MANAGER" PACKAGE_LIST[@]
        ;;
        pacman)
            PACKAGE_LIST=("git" "cmake" "ninja" "pkgconf" "base-devel"  "mesa")
            install_packages $AUTO "$SELECTED_PACKAGE_MANAGER" PACKAGE_LIST[@]
        ;;
        # brew)
        #     PACKAGE_LIST=("git" "cmake" "ninja" "pkg-config")
        #     install_packages $AUTO "$SELECTED_PACKAGE_MANAGER" PACKAGE_LIST[@]
        # ;;
    esac
}

# ------------
# Main

AUTO=false

# Skip prompt if --auto is passed
if [ "$1" = "--auto" ] ; then
    AUTO=true
fi

prompt_install_dependencies $AUTO