{ config, pkgs, lib, ... }:
with lib;

let
  cfg = config.dpad.rofi;
in
{
  options.dpad.rofi.enable = mkEnableOption (lib.mdDoc "Enable rofi");

  config = mkIf cfg.enable {
    home.packages = [
      pkgs.rofi-wayland
    ];
  };
}