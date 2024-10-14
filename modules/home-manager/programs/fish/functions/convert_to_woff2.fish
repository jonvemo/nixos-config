#!/usr/bin/env fish

function convert_to_woff2
    set -l FOLDER fonts

    # Create the folder if it doesn't exist
    mkdir -p $FOLDER

    # Find all files in the current directory with the .ttf extension
    for FILE in *.ttf
        # Apply woff2_compress to the file
        woff2_compress "$FILE"

        # Change the file extension to .woff2
        set FILE_COMPRESSED (string replace ".ttf" ".woff2" -- $FILE)

        # Move the compressed file to the destination folder
        mv "$FILE_COMPRESSED" $FOLDER
    end
end
