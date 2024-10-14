#!/usr/bin/env fish

function compress
    if test (count $argv) -ne 2
        echo "Use: compress <compress_file> <folder_to_compress>"
        return 1
    end
    set FILE $argv[1].tar.xz
    set FOLDER $argv[2]
    tar -cJf $FILE $FOLDER
    echo "Folder '$FOLDER' has been compressed to '$FILE'"
end
