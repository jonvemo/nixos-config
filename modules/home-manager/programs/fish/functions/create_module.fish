#!/usr/bin/env fish

function create_module
    set -l name $argv[1]
    mkdir $name && cd $name && touch default.nix && hx default.nix
end
