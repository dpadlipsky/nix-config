{ pkgs, ... }:

let
  rebuild = pkgs.writeShellScriptBin "nix-rebuild" ''
    sudo nixos-rebuild switch --flake ~/nixos-config/#default
  '';

in {
  home.packages = [ rebuild ];
}