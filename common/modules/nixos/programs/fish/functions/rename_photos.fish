#!/usr/bin/env fish

function rename_photos
    set FILES *.{jpg,jpeg,png,gif,webp,avif,heic}
    test -n "$FILES[1]"; or begin
        echo "Error: files not found"
        return 1
    end

    for i in (seq (count $FILES))
        set F $FILES[$i]
        set EXT (string split -r -m1 . $F)[2]
        set DATE (exiv2 -g Exif.Photo.DateTimeOriginal -Pt "$F" 2>/dev/null | string replace -a ':' '-' | string replace ' ' '_')
        test -n "$DATE"; or set DATE (date -r "$F" "+%Y-%m-%d %H%M%S")

        mv -v "$F" "Y2K-$i $DATE.$EXT"
    end
end
