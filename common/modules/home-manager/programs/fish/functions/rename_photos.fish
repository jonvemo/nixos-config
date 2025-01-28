#!/usr/bin/env fish

function rename_photos
    set IMAGE_FORMATS jpg jpeg png gif webp avif heic tiff bmp
    set COUNTER 1
    set FOUND_FILES false

    for FORMAT in $IMAGE_FORMATS
        for FILE in *.$FORMAT
            set FOUND_FILES true
            set EXIF_DATE (exiftool -DateTimeOriginal -d "%Y-%m-%d %H%M%S" "$FILE" | cut -d':' -f2- | string trim)

            if test -z "$EXIF_DATE"
                set EXIF_DATE (stat --format='%y' $FILE | cut -d'.' -f1 | sed 's/[:\t]/ /g' | awk '{print $1" "$2$3$4}')
            end

            mv -v "$FILE" "Y2K-$COUNTER $EXIF_DATE.$FORMAT"
            set COUNTER (math $COUNTER + 1)
        end
    end

    if not $FOUND_FILES
        echo "Error: files not found"
        echo "Supported formats: "(string join ', ' $IMAGE_FORMATS) >&2
        return 1
    end
end
