#!/usr/bin/env fish

set name $argv[1]
mkdir $name
cd $name
touch default.nix
hx default.nix
