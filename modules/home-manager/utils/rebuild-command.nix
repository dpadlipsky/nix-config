{ pkgs, ... }:

let
  rebuild = pkgs.writeShellScriptBin "nix-rebuild" ''
    sudo nixos-rebuild switch --flake ~/nix-config/#default
  '';

in {
  home.packages = [ rebuild ];
}