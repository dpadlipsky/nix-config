{ pkgs, ... }:

let
  rebuild = pkgs.writeShellScriptBin "nix-rebuild" ''
    sudo nixos-rebuild switch --flake ~/nixos-config/#laptop
  '';

in {
  home.packages = [ rebuild ];
}