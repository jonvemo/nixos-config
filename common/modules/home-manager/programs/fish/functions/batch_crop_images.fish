#!/usr/bin/env fish

function batch_crop_images
    set FOLDER satty # Folder to save edited images
    set FORMATS png # Only PNG zzz

    # Ensure the output folder exists
    mkdir -p $FOLDER

    # Check if there are any images to process
    set HAS_IMAGES false
    for FORMAT in $FORMATS
        if count *.$FORMAT >/dev/null
            set HAS_IMAGES true
            break
        end
    end

    if not $HAS_IMAGES
        echo "No images found with the specified formats"
        return 1
    end

    for FORMAT in $FORMATS
        for IMAGE in *.$FORMAT
            set OUTPUT_FILE "$FOLDER/$IMAGE"

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
