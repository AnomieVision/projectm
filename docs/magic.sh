#!/bin/bash

# Fix urls in ./docs/api/*.md
function fixUrls() {
    # Find files in ./docs/api that match *.md
    FILES=$(find ./docs/api -type f -name "*.md")

    # Fix urls in docs/api/*.md
    for file in $FILES
    do
        # Replace _8h with nothing
        sed -i 's/_8h//g' $file

        # Replace Files/ with api/
        sed -i 's/Files\//api\//g' $file

        # Get subdirectory name
        subdirectory=$(dirname $file | sed 's,^./docs/api/,,')
        
        # Append subdirectory name after api/
        sed -i "s|api/|api/|g" $file
    done

    # Find subdirectories in ./docs/api
    SUBDIRECTORIES=$(find ./docs/api -type d -not -path "./docs/api")

    # Fix urls in subdirectories
    for subdir in $SUBDIRECTORIES
    do
        # Find files in subdirectory that match *.md
        FILES=$(find $subdir -type f -name "*.md")

        for file in $FILES
        do
            # Replace _8h with nothing
            sed -i 's/_8h//g' $file

            # Replace Files/ with api/
            sed -i 's/Files\//api\//g' $file

            # Get subdirectory name
            subdirectory=$(dirname $file | sed 's,^./docs/api/,,')
            
            # Append subdirectory name after api/
            sed -i "s|api/|api/$subdirectory/|g" $file
        done
    done
}

# Create docsify sidebar at ./docs/.docsify/_sidebar.md, using the files in ./docs/api
function createSidebar() {
    # Remove old sidebar
    rm -rf ./docs/.docsify/_sidebar.md

    # Create new sidebar
    echo "## [General](/)" >> ./docs/.docsify/_sidebar.md
    echo "" >> ./docs/.docsify/_sidebar.md
    echo "* [Home](/)" >> ./docs/.docsify/_sidebar.md
    echo "" >> ./docs/.docsify/_sidebar.md
    echo "## [API](api/index.md)" >> ./docs/.docsify/_sidebar.md
    echo "" >> ./docs/.docsify/_sidebar.md

    # Find files in ./docs/api (excluding subdirectories) that match *.md
    FILES=$(find ./docs/api -maxdepth 1 -type f -name "*.md" | sort)

    # Create sidebar
    for file in $FILES
    do
        # Skip creating indented entry for index.md
        if [ "$(basename $file)" == "index.md" ]; then
            continue
        fi

        # Get relative path from ./docs/api/
        relativePath=${file#./docs/api/}

        # Get filename
        filename=$(basename -- "$file")

        # Get filename without extension
        filenameNoExtension="${filename%.*}"

        # Create sidebar entry
        echo "* [$filenameNoExtension](api/$relativePath)" >> ./docs/.docsify/_sidebar.md
    done

    # Find subdirectories in ./docs/api
    SUBDIRECTORIES=$(find ./docs/api -type d -not -path "./docs/api")

    # Create sidebar for subdirectories
    for subdir in $SUBDIRECTORIES
    do
        # Get relative path from ./docs/api/
        relativePath=${subdir#./docs/api/}

        # Create sidebar entry for subdirectory
        echo "* [${relativePath%/}](api/${relativePath}/index.md)" >> ./docs/.docsify/_sidebar.md

        # Find files in subdirectory that match *.md and sort them alphabetically
        FILES=$(find $subdir -type f -name "*.md" | sort)

        # Create sidebar entries for files in subdirectory (indented)
        for file in $FILES
        do
            # Skip creating indented entry for index.md
            if [ "$(basename $file)" == "index.md" ]; then
                continue
            fi

            # If contains -export then skip
            if [[ $file == *"export"* ]]; then
                continue
            fi

            # Get relative path from ./docs/api/
            relativeFilePath=${file#./docs/api/}

            # Get filename
            filename=$(basename -- "$file")

            # Get filename without extension
            filenameNoExtension="${filename%.*}"

            # Create sidebar entry (indented)
            echo "  * [$filenameNoExtension](api/$relativeFilePath)" >> ./docs/.docsify/_sidebar.md
        done
    done

    # Read ./docs/.docsify/_sidebar.md and put directories and indented entries in alphabetical order

}

function doSomeMagic() {
    rm -rf ./docs/api
    mkdir -p ./docs/api/playlist

    # Find files in ./docs/doxybook/Files that match *_8h.md
    FILES=$(find ./docs/.doxybook/generated/Files -name "*_8h.md")

    # Move and rename files
    for file in $FILES
    do
        # Get filename
        filename=$(basename -- "$file")
        # Get filename without extension
        filename="${filename%.*}"
        # Get filename without extension and without _8h
        filename="${filename%_*}"

        # if filename contains playlist__ then create subdirectory with the name before __ and move file there with the name after __ else if filename contains __ then change to -
        if [[ $filename == "playlist__"* ]]; then
            # Get subdirectory name
            subdirectory="${filename%%__*}"
            # Get filename after __
            filename="${filename##*__}"
            # Create subdirectory
            mkdir -p "./docs/api/$subdirectory"
            # Move and rename file
            mv "$file" "./docs/api/$subdirectory/$filename.md"
            echo "Moved file: $filename"
        elif [[ $filename == *"__"* ]]; then
            if [ ! -d "./docs/api/projectm" ]; then
                mkdir -p "./docs/api/projectm"
            fi
            # Change _ to -
            filename="${filename//__/-}"
            # Move and rename file
            mv "$file" "./docs/api/projectm/$filename.md"
            echo "Moved file: $filename"
        elif [[ $filename == *"_"* ]]; then
            if [ ! -d "./docs/api/projectm" ]; then
                mkdir -p "./docs/api/projectm"
            fi
            # Change _ to -
            filename="${filename//_/-}"
            # Move and rename file
            mv "$file" "./docs/api/projectm/$filename.md"
            echo "Moved file: $filename"
        elif [[ $filename == "playlist" ]]; then
            if [ ! -d "./docs/api/projectm" ]; then
                mkdir -p "./docs/api/projectm"
            fi
            # Move and rename file
            mv "$file" "./docs/api/playlist/index.md"
            echo "Moved file: $filename"
        elif [[ $filename == "projectM" ]]; then
            if [ ! -d "./docs/api/projectm" ]; then
                mkdir -p "./docs/api/projectm"
            fi
            # Move and rename file
            mv "$file" "./docs/api/projectm/index.md"
            echo "Moved file: $filename"
        elif [[ $filename == "projectm-eval" ]]; then
            if [ ! -d "./docs/api/projectm" ]; then
                mkdir -p "./docs/api/projectm"
            fi
            # Move and rename file
            mv "$file" "./docs/api/$filename.md"
            echo "Moved file: $filename"
        else
            if [ ! -d "./docs/api/projectm" ]; then
                mkdir -p "./docs/api/projectm"
            fi
            # Move and rename file
            mv "$file" "./docs/api/projectm/$filename.md"
            echo "Moved file: $filename"
        fi
        
    done
}

doSomeMagic
createSidebar
fixUrls
