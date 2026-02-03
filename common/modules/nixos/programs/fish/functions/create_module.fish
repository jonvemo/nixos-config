#!/usr/bin/env fish

function create_module
    if test (count $argv) -ne 1
        echo "Usage: create_module <module>"
        return 1
    end

    set -l NAME $argv[1]

    mkdir -p $NAME
    touch $NAME/default.nix

    # Add the new module to imports
    sed -i "/imports = \[/,/\]/ {
        /\]/i \    ./$NAME
    }" default.nix

    hx $NAME/default.nix

    # Makes the new module trackable by git
    git add $NAME default.nix
end
