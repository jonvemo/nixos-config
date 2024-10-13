#!/usr/bin/env fish

function convert_images
    if test (count $argv) -ne 2
        echo 'Usage: convert_images "<input_formats>" <output_format>'
        return 1
    end

    set INPUT_FORMATS (string split ' ' $argv[1])
    set OUTPUT_FORMAT $argv[2]

    # Name of the folder to save the converted files
    set FOLDER converted_$OUTPUT_FORMAT

    # Create the folder if it doesn't exist
    mkdir -p $FOLDER

    # Find all files in the current folder with the input extensions
    for FORMAT in $INPUT_FORMATS
        # Find all files in the current folder with the input extension
        for FILE in *.$FORMAT
            # Change the file extension to the output format
            set FILE_CONVERTED (string replace ".$FORMAT" ".$OUTPUT_FORMAT" -- $FILE)
            ffmpeg -i "$FILE" $FILE_CONVERTED
            mv "$FILE_CONVERTED" $FOLDER
        end
    end
end
