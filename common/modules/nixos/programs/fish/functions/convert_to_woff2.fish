#!/usr/bin/env fish

function convert_to_woff2
    mkdir -p fonts
    for file in *.ttf
        woff2_compress $file
    end
    mv *.woff2 fonts/
end
