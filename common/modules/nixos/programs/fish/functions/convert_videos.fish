#!/usr/bin/env fish

function convert_videos
    if test (count $argv) -ne 2
        echo 'Usage: convert_videos "<input_extensions>" <output_extension>'
        echo 'Example: convert_videos "mp4 mov mkv" webm'
        return 1
    end

    set IN_EXTS (string split ' ' $argv[1])
    set OUT $argv[2]
    set FOLDER "converted_$OUT"
    mkdir -p $FOLDER

    for F in *.{$IN_EXTS}
        test -f "$F"; or continue

        set BASE (string replace -r '\.[^.]+$' '' $F)
        set TARGET "$FOLDER/$BASE.$OUT"

        ffmpeg -i "$F" -map_metadata 0 -c:v libsvtav1 -preset 4 -crf 50 -svtav1-params tune=0:enable-overlays=1 -vf "scale='min(1280,iw)':-2" -c:a libopus -b:a 64k "$TARGET" -y

        if test -f "$TARGET"
            set SIZE_ORIG (stat -c%s "$F")
            set SIZE_NEW (stat -c%s "$TARGET")

            if test $SIZE_NEW -ge $SIZE_ORIG
                echo "Skipping $F: Original is already more efficient"
                rm "$TARGET"
            else
                touch -r "$F" "$TARGET"
            end
        end
    end
end
