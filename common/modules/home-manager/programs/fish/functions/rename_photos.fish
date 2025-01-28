#!/usr/bin/env fish

function rename_photos
    if test (count $argv) -ne 1
        echo 'Usage: rename_photos "<file_format1> <file_format2> ..."'
        return 1
    end

    set FILE_FORMATS (string split ' ' $argv[1])
    set COUNTER 1

    for FORMAT in $FILE_FORMATS
        for FILE in *.$FORMAT
            # Get Original Date with EXIF
            set EXIF_DATE (exiftool -DateTimeOriginal -d "%Y-%m-%d %H%M%S" "$FILE" | cut -d':' -f2- | string trim)

            if test -z "$EXIF_DATE"
                set EXIF_DATE (stat --format='%y' $FILE | cut -d'.' -f1 | sed 's/[:\t]/ /g' | awk '{print $1" "$2$3$4}')
            end

            mv -v "$FILE" "Y2K-$COUNTER $EXIF_DATE.$FORMAT"
            set COUNTER (math $COUNTER + 1)
        end
    end
end
