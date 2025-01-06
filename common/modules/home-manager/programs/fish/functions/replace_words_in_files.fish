#!/usr/bin/env fish

function replace_words_in_files
    # Check if two arguments are provided
    if test (count $argv) -ne 2
        echo "Usage: replace_words_in_files <search_word> <replacement_word>"
        return 1
    end

    # Set the arguments to variables
    set SEARCH_WORD $argv[1]
    set REPLACEMENT_WORD $argv[2]

    # Directory to search (current directory)
    set DIRECTORY $PWD

    # Iterate over all files in the current directory and subdirectories
    for file in (find $DIRECTORY -type f)
        # Use sed to replace the word in each file
        sed -i "s/$SEARCH_WORD/$REPLACEMENT_WORD/g" $file
        echo "Processed $file"
    end

    echo "Replacement completed"
end
