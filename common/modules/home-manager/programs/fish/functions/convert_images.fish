#!/usr/bin/env fish

function convert_images
    if test (count $argv) -ne 2
        echo 'Usage: convert_images "<input_formats>" <output_format>'
        return 1
    end

    set INPUT_FORMATS (string split ' ' $argv[1])
    set OUTPUT_FORMAT $argv[2]

    # Format settings
    set ALLOW_FORMATS png jpg jpeg webp avif heic
    set RESTRICTED_INPUTS heic avif
    set RESTRICTED_OUTPUTS heic avif
    set SUPPORTED_ENCODER_INPUTS png jpg jpeg
    set INTERMEDIATE_FORMAT png

    # Check allowed formats
    for FORMAT in $INPUT_FORMATS
        if not contains -- $FORMAT $ALLOW_FORMATS
            echo "Error: Input format '$FORMAT' not supported"
            return 1
        end
    end

    if not contains -- $OUTPUT_FORMAT $ALLOW_FORMATS
        echo "Error: Output format '$OUTPUT_FORMAT' not supported"
        return 1
    end

    # Create destination folder
    set FOLDER converted_$OUTPUT_FORMAT
    mkdir -p $FOLDER

    # Process files
    for FORMAT in $INPUT_FORMATS
        for FILE in *.$FORMAT
            set FILE_CONVERTED "$FOLDER/"(string replace ".$FORMAT" ".$OUTPUT_FORMAT" -- $FILE)

            # Condition corrected using begin/end
            if contains -- $FORMAT $RESTRICTED_INPUTS; or begin
                    contains -- $OUTPUT_FORMAT $RESTRICTED_OUTPUTS
                    and not contains -- $FORMAT $SUPPORTED_ENCODER_INPUTS
                end
                echo "Using two-step conversion for: $FILE"
                set INTERMEDIATE_FILE "$FOLDER/"(string replace ".$FORMAT" ".$INTERMEDIATE_FORMAT" -- $FILE)

                # Step 1: Conversion to intermediate format
                if contains -- $FORMAT heic
                    heif-dec "$FILE" "$INTERMEDIATE_FILE"
                else if contains -- $FORMAT avif
                    avifdec "$FILE" "$INTERMEDIATE_FILE"
                else
                    ffmpeg -i "$FILE" "$INTERMEDIATE_FILE"
                end

                if not test -f "$INTERMEDIATE_FILE"
                    echo "Error creating intermediate for $FILE"
                    continue
                end

                #Step 2: Final Conversion
                if contains -- $OUTPUT_FORMAT heic
                    heif-enc "$INTERMEDIATE_FILE" "$FILE_CONVERTED"
                else if contains -- $OUTPUT_FORMAT avif
                    avifenc "$INTERMEDIATE_FILE" "$FILE_CONVERTED"
                else
                    ffmpeg -i "$INTERMEDIATE_FILE" "$FILE_CONVERTED"
                end

                rm -f "$INTERMEDIATE_FILE"
            else
                # Direct conversion
                echo "Using direct conversion for: $FILE"
                if contains -- $OUTPUT_FORMAT $RESTRICTED_OUTPUTS
                    if contains -- $OUTPUT_FORMAT heic
                        heif-enc "$FILE" "$FILE_CONVERTED"
                    else if contains -- $OUTPUT_FORMAT avif
                        avifenc "$FILE" "$FILE_CONVERTED"
                    else
                        ffmpeg -i "$FILE" "$FILE_CONVERTED"
                    end
                else
                    ffmpeg -i "$FILE" "$FILE_CONVERTED"
                end
            end

            # Preserve metadata
            if test -f "$FILE_CONVERTED"
                exiftool -TagsFromFile "$FILE" "-All:All>All:All" "$FILE_CONVERTED" -overwrite_original -P
                echo "Converted: $FILE -> $FILE_CONVERTED"
            else
                echo "Conversion error: $FILE"
            end
        end
    end
end
