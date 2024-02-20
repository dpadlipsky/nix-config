{ pkgs, ... }:


# TOOD: Add current theme for rofi
{
  home.packages = [
    pkgs.rofi-wayland
  ];
}