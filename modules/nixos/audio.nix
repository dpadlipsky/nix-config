{ config, pkgs, ... }:

{
  services.pipewire = {
    enable = true;
  };

  hardware.pulseaudio.enable = true;

  programs.noisetorch.enable = true;
}