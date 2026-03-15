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
        test -f "$F"; or continue

        set BASE (string replace -r '\.[^.]+$' '' $F)
        set EXT (string lower (string split -r -m1 . $F)[2])
        set TARGET "$FOLDER/$BASE.$OUT"

        if contains $OUT heic avif
            if contains $EXT png jpg jpeg
                test $OUT = heic; and heif-enc "$F" "$TARGET"; or avifenc "$F" "$TARGET"
            else
                set TMP "$FOLDER/$BASE.tmp.png"
                if test "$EXT" = heic
                    heif-dec "$F" "$TMP"
                else if test "$EXT" = avif
                    avifdec "$F" "$TMP"
                else
                    ffmpeg -i "$F" "$TMP" -y
                end

                test $OUT = heic; and heif-enc "$TMP" "$TARGET"; or avifenc "$TMP" "$TARGET"
                rm -f "$TMP"
            end
        else
            ffmpeg -i "$F" "$TARGET" -y
        end

        if test -f "$TARGET"
            exiv2 extract -ea "$F" 2>/dev/null
            if test -f "$BASE.exv"
                exiv2 insert -ia -l . "$TARGET" 2>/dev/null
                rm -f "$BASE.exv"
            end

            touch -r "$F" "$TARGET"
            echo "Done: $F"
        end
    end
end
