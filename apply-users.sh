#!/bin/sh
pushd ~/.setup
nix build .#homeConfigurations.quartix.activationPackage
./result/activate
popd
