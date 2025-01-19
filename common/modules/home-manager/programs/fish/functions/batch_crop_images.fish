#!/usr/bin/env fish

function batch_crop_images
    # Input folder is the current directory
    set INPUT_FOLDER (pwd)
    set OUTPUT_FOLDER satty # Folder to save edited images

    # Ensure the output folder exists
    mkdir -p $OUTPUT_FOLDER

    # Get a list of images from the input folder
    set IMAGES (ls $INPUT_FOLDER/*.png)

    # Check if there are any images to process
    if test (count $IMAGES) -eq 0
        echo "No PNG images found in $INPUT_FOLDER."
        return 1
    end

    # Iterate over each image
    for IMAGE in $IMAGES
        set BASENAME (basename $IMAGE)
        set OUTPUT_FILE "$OUTPUT_FOLDER/$BASENAME"

        echo "Editing: $IMAGE"

        # Open the image with satty
        satty -f $IMAGE -o $OUTPUT_FILE --fullscreen --early-exit --initial-tool crop

        # Check if the command was successful
        if test $status -ne 0
            echo "An error occurred while editing. Exiting function."
            return 1
        end

        echo "Saved to: $OUTPUT_FILE"
    end

    echo "All images have been processed."
end
