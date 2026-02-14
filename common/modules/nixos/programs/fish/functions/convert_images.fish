#!/usr/bin/env fish

function convert_images
    if test (count $argv) -ne 2
        echo 'Usage: convert_images "<inputs>" <out_ext>'
        return 1
    end

    set IN_EXTS (string split ' ' $argv[1])
    set OUT $argv[2]
    set FOLDER "converted_$OUT"
    mkdir -p $FOLDER

    for F in *.{$IN_EXTS}
        set BASE (string replace -r '\.[^.]+$' '' $F)
        set EXT (string lower (string split -r -m1 . $F)[2])
        set TARGET "$FOLDER/$BASE.$OUT"

        if contains $OUT heic avif
            if test "$EXT" = png
                test $OUT = heic; and heif-enc "$F" "$TARGET"; or avifenc "$F" "$TARGET"
            else
                set TMP "$FOLDER/$BASE.tmp.png"
                switch $EXT
                    case heic
                        heif-dec "$F" "$TMP"
                    case avif
                        avifdec "$F" "$TMP"
                    case '*'
                        ffmpeg -i "$F" -vquiet "$TMP"
                end
                test $OUT = heic; and heif-enc "$TMP" "$TARGET"; or avifenc "$TMP" "$TARGET"
                rm -f "$TMP"
            end
        else
            ffmpeg -i "$F" "$TARGET"
        end

        test -f "$TARGET"; and exiv2 -it "$TARGET" "$F" 2>/dev/null; and echo "Done: $F"
    end
end
