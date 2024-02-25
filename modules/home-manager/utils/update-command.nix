{ config, pkgs, lib, ... }:
with lib;

let
  update = pkgs.writeShellScriptBin "nix-update" ''
    pushd ~/nixos-config
    nix flake update && nix-rebuild
    popd
  '';
in
{

  # This property is required
  options.dpad.hostLabel = mkOption {
    type = types.str;
  };

  config = {
    home.packages = [ update ];
  };
}