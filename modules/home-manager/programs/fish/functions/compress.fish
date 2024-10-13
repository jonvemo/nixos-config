#!/usr/bin/env fish

function compress
    if test (count $argv) -ne 2
        echo "Use: compress <file_name> <folder_to_compress>"
        return 1
    end
    set FILE $argv[1].tar.xz
    set FOLDER $argv[2]
    tar -cJf $FILE $FOLDER
    echo "La carpeta '$FOLDER' ha sido comprimida en '$FILE'."
end
