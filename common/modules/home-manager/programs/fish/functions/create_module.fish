#!/usr/bin/env fish

function create_module
    set -l NAME $argv[1]
    mkdir $NAME && cd $NAME && touch default.nix && hx default.nix
end
