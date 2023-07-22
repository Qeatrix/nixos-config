#!/bin/sh
pushd ~/.setup
sudo nixos-rebuild $1 --flake .#$2 $3
popd
