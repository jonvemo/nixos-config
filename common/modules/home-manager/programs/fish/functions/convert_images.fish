#!/usr/bin/env fish

function convert_images
    if test (count $argv) -ne 2
        echo 'Usage: convert_images "<input_formats>" <output_format>'
        return 1
    end

    set INPUT_FORMATS (string split ' ' $argv[1])
    set OUTPUT_FORMAT $argv[2]
    set ALLOW_FORMATS png jpg jpeg webp avif heic
    set RESTRICTED_INPUTS heic avif
    set RESTRICTED_OUTPUTS heic avif
    set SUPPORTED_ENCODER_INPUTS png jpg jpeg
    set INTERMEDIATE_FORMAT png

    set FOLDER converted_$OUTPUT_FORMAT
    mkdir -p $FOLDER

    for FORMAT in $INPUT_FORMATS
        for FILE in *.$FORMAT
            set FILE_CONVERTED "$FOLDER/"(string replace ".$FORMAT" ".$OUTPUT_FORMAT" -- $FILE)

            if contains -- $FORMAT $RESTRICTED_INPUTS; or begin
                    contains -- $OUTPUT_FORMAT $RESTRICTED_OUTPUTS
                    and not contains -- $FORMAT $SUPPORTED_ENCODER_INPUTS
                end
                set INTERMEDIATE_FILE "$FOLDER/"(string replace ".$FORMAT" ".$INTERMEDIATE_FORMAT" -- $FILE)

                if contains -- $FORMAT heic
                    heif-dec "$FILE" "$INTERMEDIATE_FILE"
                else if contains -- $FORMAT avif
                    avifdec "$FILE" "$INTERMEDIATE_FILE"
                else
                    ffmpeg -i "$FILE" "$INTERMEDIATE_FILE"
                end

                if not test -f "$INTERMEDIATE_FILE"
                    continue
                end

                if not contains -- $OUTPUT_FORMAT png
                    if contains -- $OUTPUT_FORMAT heic
                        heif-enc "$INTERMEDIATE_FILE" "$FILE_CONVERTED"
                    else if contains -- $OUTPUT_FORMAT avif
                        avifenc "$INTERMEDIATE_FILE" "$FILE_CONVERTED"
                    else
                        ffmpeg -i "$INTERMEDIATE_FILE" "$FILE_CONVERTED"
                    end
                    rm -f "$INTERMEDIATE_FILE"
                else
                    set FILE_CONVERTED "$INTERMEDIATE_FILE"
                end
            else
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

            if test -f "$FILE_CONVERTED"
                exiv2 -it "$FILE_CONVERTED" "$FILE" 2>/dev/null
                echo "Converted: $FILE -> $FILE_CONVERTED"
            end
        end
    end
end
