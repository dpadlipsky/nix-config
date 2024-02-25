{ config, pkgs, lib, ... }:
with lib;

let
  cfg = config.dpad.cursor;
in
{
  options.dpad.cursor.enable = mkEnableOption (lib.mdDoc "Enable custom cursor");

  config = mkIf cfg.enable {
    home.pointerCursor = {
      size = 24;
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Classic";
    };
  };
}
