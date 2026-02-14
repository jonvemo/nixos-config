#!/usr/bin/env fish

function convert_animatic_images
    if test (count $argv) -ne 2
        echo 'Usage: convert_animations "<input_formats>" <output_format>'
        return 1
    end

    set INPUT_FORMATS (string split ' ' $argv[1])
    set OUTPUT_FORMAT $argv[2]
    set FOLDER "animated_$OUTPUT_FORMAT"
    mkdir -p $FOLDER

    for FILE in *.{$INPUT_FORMATS}
        set OUTPUT "$FOLDER/"(string replace -r '\.[^.]+$' ".$OUTPUT_FORMAT" $FILE)

        switch $OUTPUT_FORMAT
            case webm
                ffmpeg -i "$FILE" -c:v libaom-av1 -crf 30 -b:v 0 -cpu-used 4 -row-mt 1 -movflags +faststart -an "$OUTPUT"
            case mp4
                ffmpeg -i "$FILE" -c:v libx265 -crf 24 -preset slow -tag:v hvc1 -movflags +faststart -an "$OUTPUT"
            case gif
                ffmpeg -i "$FILE" -vf "fps=15,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 "$OUTPUT"
            case webp
                ffmpeg -i "$FILE" -c:v libwebp -loop 0 -lossless 0 -qscale 75 -preset default -an "$OUTPUT"
            case avif
                ffmpeg -i "$FILE" -c:v libaom-av1 -crf 23 -cpu-used 4 -f avif -movflags +faststart -still-picture 0 -loop 0 "$OUTPUT"
            case '*'
                continue
        end

        if test -f "$OUTPUT"
            exiv2 -it "$OUTPUT" "$FILE" 2>/dev/null
            echo "Successfully converted: $OUTPUT"
        end
    end
end
