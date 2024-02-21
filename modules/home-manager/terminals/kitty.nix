{ pkgs, programs, ... }:

{
  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
    };
    settings = {
      background_opacity = "0.90";
    };
    shellIntegration.enableBashIntegration = true;
    theme = "Tokyo Night";
  };
}