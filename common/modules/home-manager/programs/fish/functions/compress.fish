#!/usr/bin/env fish

function compress
    if test (count $argv) -ne 2
        echo "Use: compress <output_name> <folder_to_compress>"
        return 1
    end

    set FILE "$argv[1].tar.xz"
    set FOLDER "$argv[2]"

    if not test -d "$FOLDER"
        echo "Error: Folder '$FOLDER' does not exist."
        return 1
    end

    if tar -cJf "$FILE" "$FOLDER"
        echo "Folder '$FOLDER' has been compressed to '$FILE'"
    else
        echo "Error: Failed to compress '$FOLDER'."
        return 1
    end
end
