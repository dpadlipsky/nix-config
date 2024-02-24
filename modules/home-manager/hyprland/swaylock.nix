{ config, pkgs, lib, ... }:
with lib;

let
  cfg = config.dpad.swaylock;
  wallpaper = ./wallpaper.jpg;
in
{
  options.dpad.swaylock.enable = mkEnableOption (lib.mdDoc "Enable swaylock");

  config = mkIf cfg.enable {
    programs.swaylock = {
      enable = true;
      settings = {
        image = toString wallpaper;
        indicator-idle-visible = true;
        ring-color = "383c4a70";
        key-hl-color = "ffffff70";
        line-color = "00000070";
        inside-color = "000000aa";

        ring-clear-color = "00000070";
        inside-clear-color = "00000070";
        line-clear-color = "00000070";
      };
    };
  };

}