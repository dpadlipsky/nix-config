{ config, pkgs, lib, ... }:
with lib;

let
  rebuild = pkgs.writeShellScriptBin "nix-rebuild" ''
    sudo nixos-rebuild switch --flake ~/nixos-config/#${config.dpad.hostLabel}
  '';
in
{

  # This property is required
  options.dpad.hostLabel = mkOption {
    type = types.str;
  };

  config = {
    home.packages = [ rebuild ];
  };
}