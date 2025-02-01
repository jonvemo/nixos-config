#!/usr/bin/env fish

function batch_crop_images
    set FOLDER satty # Folder to save edited images
    set FORMATS png # Only PNG zzz

    # Ensure the output folder exists
    mkdir -p $FOLDER

    # Get a list of images from the input folder

    # Check if there are any images to process
    if test (count $FORMATS) -eq 0
        echo "No (png/jpg/jpeg) images found"
        return 1
    end

    for FORMAT in $FORMATS
        for IMAGE in *.$FORMAT
            set OUTPUT_FILE "$FOLDER/"(basename $IMAGE)

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
    end

    echo "All images have been processed."
end
