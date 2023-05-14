#!/bin/sh
pushd ~/.setup
sudo nixos-rebuild switch --flake .#$1 $2
popd
