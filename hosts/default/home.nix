{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  programs.bash.enable = true;

  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../modules/home-manager
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "dpadlipsky";
  home.homeDirectory = "/home/dpadlipsky";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    vscode
    discord
    lm_sensors
    sublime
    spotify
    chromium
    firefox
    discord-screenaudio
    pulsemixer
    wireplumber
    xdg-desktop-portal-hyprland
    webcord
    neovim
    gh
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  dpad = {
    cursor.enable = true;

    hostLabel = "default";

    hyprland = {
      enable = true;
      sensitivity = -0.5;
      animations.enable = true;
    };

    hyprpaper.enable = true;
    rofi.enable = true;
    waybar.enable = true;
    swaylock.enable = true;
  };
}
