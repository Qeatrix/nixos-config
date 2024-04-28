{ config, pkgs, lib, ... }:

{
  virtualisation = {
    containers.enable = true;
    virtualbox.host.enable = true;
    virtualbox.host.enableExtensionPack = true;
    # vmware.host.enable = true;
  };
}
