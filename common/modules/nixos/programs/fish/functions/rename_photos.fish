#!/usr/bin/env fish

function rename_photos
    set IMAGE_FORMATS jpg jpeg png gif webp avif heic tiff bmp
    set COUNTER 1
    set FOUND_FILES false

    for FORMAT in $IMAGE_FORMATS
        for FILE in *.$FORMAT
            set FOUND_FILES true
            set EXIF_DATE (exiv2 -g Exif.Photo.DateTimeOriginal -Pt "$FILE" 2>/dev/null | string replace -a ':' '-' | string replace ' ' '_')

            if test -z "$EXIF_DATE"
                set EXIF_DATE (stat --format='%y' $FILE | cut -d'.' -f1 | sed 's/[:\t]/ /g' | awk '{print $1" "$2$3$4}')
            end

            mv -v "$FILE" "Y2K-$COUNTER $EXIF_DATE.$FORMAT"
            set COUNTER (math $COUNTER + 1)
        end
    end

    if not $FOUND_FILES
        echo "Error: files not found"
        return 1
    end
end
