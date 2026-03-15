#!/usr/bin/env fish

function rename_photos
    set FILES *.{jpg,jpeg,png,gif,webp,avif,heic}
    set -q FILES[1]; or return 1

    set PADDING (string length (count $FILES))

    for i in (seq (count $FILES))
        set F $FILES[$i]
        set EXT (string split -r -m1 . $F)[2]

        set RAW (exiv2 -g Exif.Photo.DateTimeOriginal -Pt "$F" 2>/dev/null; or date -r "$F" "+%Y:%m:%d %H:%M:%S")

        set DATE (string replace -r '(\d{4}):(\d{2}):(\d{2}) (\d{2}):(\d{2}):(\d{2})' '$1-$2-$3 $4$5$6' "$RAW")

        set INDEX (string pad -w $PADDING -c 0 $i)
        set NEW "Y2K-$INDEX $DATE.$EXT"

        test "$F" != "$NEW"; and mv -v "$F" "$NEW"
    end
end
