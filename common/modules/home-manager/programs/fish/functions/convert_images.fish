#!/usr/bin/env fish

function convert_images
    if test (count $argv) -ne 2
        echo 'Usage: convert_images "<input_formats>" <output_format>'
        return 1
    end

    set INPUT_FORMATS (string split ' ' $argv[1])
    set OUTPUT_FORMAT $argv[2]

    # Format settings
    set RESTRICTED_INPUTS heic heif avif
    set ALLOWED_OUTPUTS jpg jpeg png y4m
    set INTERMEDIATE_FORMAT png # Default intermediate format

    # Create destination folder
    set FOLDER converted_$OUTPUT_FORMAT
    mkdir -p $FOLDER

    # Process files
    for FORMAT in $INPUT_FORMATS
        for FILE in *.$FORMAT
            set FILE_CONVERTED (string replace ".$FORMAT" ".$OUTPUT_FORMAT" -- $FILE)

            # Check if you need two-step conversion
            if contains -- $FORMAT $RESTRICTED_INPUTS; and not contains -- $OUTPUT_FORMAT $ALLOWED_OUTPUTS
                set INTERMEDIATE_FILE (string replace ".$FORMAT" ".$INTERMEDIATE_FORMAT" -- $FILE)

                # Step 1: Conversion to intermediate format
                if contains -- $FORMAT heic heif
                    heif-dec "$FILE" "$INTERMEDIATE_FILE"
                else if contains -- $FORMAT avif
                    avifdec "$FILE" "$INTERMEDIATE_FILE"
                end

                if not test -f "$INTERMEDIATE_FILE"
                    echo "Error creating intermediate for $FILE"
                    continue
                end

                # Step 2: Convert to final format with appropriate encoder
                if contains -- $OUTPUT_FORMAT heic heif
                    heif-enc "$INTERMEDIATE_FILE" "$FILE_CONVERTED"
                else if contains -- $OUTPUT_FORMAT avif
                    avifenc "$INTERMEDIATE_FILE" "$FILE_CONVERTED"
                else
                    ffmpeg -i "$INTERMEDIATE_FILE" "$FILE_CONVERTED"
                end

                rm -f "$INTERMEDIATE_FILE"
            else
                # Direct conversion for other cases
                if contains -- $FORMAT heic heif
                    heif-dec "$FILE" "$FILE_CONVERTED"
                else if contains -- $FORMAT avif
                    avifdec "$FILE" "$FILE_CONVERTED"
                else if contains -- $OUTPUT_FORMAT heic heif
                    heif-enc "$FILE" "$FILE_CONVERTED"
                else if contains -- $OUTPUT_FORMAT avif
                    avifenc "$FILE" "$FILE_CONVERTED"
                else
                    ffmpeg -i "$FILE" "$FILE_CONVERTED"
                end
            end

            # Move converted file
            if test -f "$FILE_CONVERTED"
                mv "$FILE_CONVERTED" $FOLDER
                echo "Converted: $FILE -> $FOLDER/$FILE_CONVERTED"
            else
                echo "Conversion Error: $FILE"
            end
        end
    end
end
