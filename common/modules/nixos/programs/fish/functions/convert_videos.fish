#!/usr/bin/env fish

function convert_videos
    set IN_EXTS mp4 mov mkv
    set FOLDER converted_webm

    mkdir -p $FOLDER

    for F in *.{$IN_EXTS}
        test -f "$F"; or continue

        set BASE (string replace -r '\.[^.]+$' '' $F)
        set TARGET "$FOLDER/$BASE.webm"

        ffmpeg -i "$F" \
            -map_metadata 0 -c:v libsvtav1 -preset 6 -crf 40 -svtav1-params tune=0 -r 30 -c:a libopus -b:a 128k "$TARGET" -y

        if test -f "$TARGET"
            set SIZE_ORIG (stat -c%s "$F")
            set SIZE_NEW (stat -c%s "$TARGET")

            if test $SIZE_NEW -ge $SIZE_ORIG
                echo "Skipping $F: Original is already more efficient."
                rm "$TARGET"
            else
                touch -r "$F" "$TARGET"
                echo "Done: $TARGET"
            end
        end
    end
end
