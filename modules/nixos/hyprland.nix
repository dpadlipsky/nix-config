{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    qt5.qtwayland
    qt6.qtwayland
    xdg-desktop-portal-hyprland
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
