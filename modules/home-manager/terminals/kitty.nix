{ pkgs, programs, ... }:


{
  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
    };
    settings = {
      background_opacity = "0.90";
      scrollback_lines = 10000;
      mouse_map = "ctrl+left click ungrabbed mouse_handle_click selection link prompt";
    };
    shellIntegration.enableBashIntegration = true;
    theme = "Tokyo Night";
  };
}