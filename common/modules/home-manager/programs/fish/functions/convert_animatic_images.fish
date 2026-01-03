#!/usr/bin/env fish

function convert_animatic_images
    if test (count $argv) -ne 2
        echo 'Usage: convert_animations "<input_formats>" <output_format>'
        echo 'Example: convert_animations "mp4 webm gif avif" webp'
        return 1
    end

    set INPUT_FORMATS (string split ' ' $argv[1])
    set OUTPUT_FORMAT $argv[2]

    # Supported formats (animated)
    set ANIMATED_FORMATS webm mp4 gif webp avif

    # Check output format
    if not contains -- $OUTPUT_FORMAT $ANIMATED_FORMATS
        echo "Error: Output format must be animated (webm/mp4/gif/webp/avif)"
        return 1
    end

    # Check input formats
    for FORMAT in $INPUT_FORMATS
        if not contains -- $FORMAT $ANIMATED_FORMATS
            echo "Error: Input format '$FORMAT' not supported"
            return 1
        end
    end

    # Create output directory
    set FOLDER "animated_$OUTPUT_FORMAT"
    mkdir -p $FOLDER

    # Convert files
    for FORMAT in $INPUT_FORMATS
        for FILE in *.$FORMAT
            set OUTPUT "$FOLDER/"(basename $FILE .$FORMAT).$OUTPUT_FORMAT

            echo "Converting: $FILE → $OUTPUT"

            switch $OUTPUT_FORMAT
                case webm
                    #AV1 with modern settings (WebM container)
                    ffmpeg -i "$FILE" \
                        -c:v libaom-av1 \
                        -crf 30 \
                        -b:v 0 \
                        -cpu-used 4 \
                        -row-mt 1 \
                        -movflags +faststart \
                        -an \
                        "$OUTPUT"

                case mp4
                    #H.265 for maximum efficiency
                    ffmpeg -i "$FILE" \
                        -c:v libx265 \
                        -crf 24 \
                        -preset slow \
                        -tag:v hvc1 \
                        -movflags +faststart \
                        -an \
                        "$OUTPUT"

                case gif
                    # Optimization for GIF
                    ffmpeg -i "$FILE" \
                        -vf "fps=15,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
                        -loop 0 \
                        "$OUTPUT"

                case webp
                    # WebP animated
                    ffmpeg -i "$FILE" \
                        -c:v libwebp \
                        -loop 0 \
                        -lossless 0 \
                        -qscale 75 \
                        -preset default \
                        -an \
                        "$OUTPUT"

                case avif
                    # Avif animated
                    ffmpeg -i "$FILE" \
                        -c:v libaom-av1 \
                        -crf 23 \
                        -cpu-used 4 \
                        -f avif \
                        -movflags +faststart \
                        -still-picture 0 \
                        -loop 0 \
                        "$OUTPUT"

            end

            # Preserve basic metadata
            if test -f "$OUTPUT"
                exiftool -TagsFromFile "$FILE" "-All:All>All:All" "$OUTPUT" -overwrite_original -P
                echo "Successfully converted: $OUTPUT"
            else
                echo "Error converting: $FILE"
            end
        end
    end
end
