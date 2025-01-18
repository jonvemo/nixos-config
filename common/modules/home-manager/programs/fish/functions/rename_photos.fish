#!/usr/bin/env fish

function rename_photos
    if test (count $argv) -ne 1
        echo 'Usage: rename_photos "<file_format1> <file_format2> ..."'
        return 1
    end

    set FILE_FORMATS (string split ' ' $argv[1])

    for FORMAT in $FILE_FORMATS
        for FILE in *.$FORMAT
            # Get the creation date of the image
            set CREATION_DATE (stat --format='%y' $FILE | cut -d'.' -f1 | sed 's/[:\t]/ /g' | awk '{print $1" "$2$3$4}')

            # Rename the image with the creation date
            mv $FILE "$CREATION_DATE.$FORMAT"
        end
    end
end
