#!/bin/bash

# Install doxygen, if not installed.
function install_doxygen {
    if ! command -v doxygen &> /dev/null
    then
        echo "Doxygen not found. Installing..."
        sudo apt update
        sudo apt install doxygen -y
    fi

    # Check if doxygen is installed.
    if ! command -v doxygen &> /dev/null
    then
        echo "Doxygen not found. Please install manually."
        exit
    fi
}

# Install doxybook2, if not installed.
# Download zip from: https://github.com/matusnovak/doxybook2/releases/download/v1.5.0/doxybook2-linux-amd64-v1.5.0.zip
# Unzip and move to /usr/local/bin
# Set permissions: chmod +x /usr/local/bin/doxybook2
function install_doxybook2 {
    ROOT=$(pwd)
    TEMP=$ROOT/docs/.doxybook/.temp

    if ! command -v doxybook2 &> /dev/null
    then
        echo "Doxybook2 not found. Installing..."
        sudo apt update && sudo apt install unzip
        mkdir -p $TEMP
        cd $TEMP
        wget https://github.com/matusnovak/doxybook2/releases/download/v1.5.0/doxybook2-linux-amd64-v1.5.0.zip
        unzip doxybook2-linux-amd64-v1.5.0.zip
        sudo mv ./bin/doxybook2 /usr/local/bin
        sudo chmod +x /usr/local/bin/doxybook2
        cd $ROOT
        rm $TEMP
    fi

    # Check if doxybook2 is installed.
    if ! command -v doxybook2 &> /dev/null
    then
        echo "Doxybook2 not found. Please install manually."
        exit
    fi
}

# Recreate generated and api directories.
function manage_directories {
    rm -rf ./docs/doxybook/*
    touch ./docs/doxybook/.keep
}

# Generate docs using doxygen and doxybook2.
function generate_docs {
    # Generate docs.
    doxygen ./docs/.doxygen/Doxyfile

    # Generate docs using doxybook2.
    doxybook2 --input ./docs/.doxygen/xml --output ./docs/doxybook --templates ./docs/.doxybook/templates --config ./docs/.doxybook/config.json
}

# -------------------

function main {
    install_doxygen
    install_doxybook2
    manage_directories
    generate_docs

    echo "Docs generated successfully."
}

main