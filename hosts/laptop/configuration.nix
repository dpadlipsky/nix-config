{ config, pkgs, inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix

      inputs.home-manager.nixosModules.default

      ../../modules/nixos/hyprland.nix
      ../../modules/nixos/audio.nix
      ../../modules/nixos/fonts.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
    default = "SAVED";
    timeoutStyle = "countdown";
  };
  boot.loader.grub.gfxmodeEfi = "1024x768";

  networking.hostName = "dpadlipsky";

  networking.networkmanager.enable = true;
  networking.wireless.enable = false;
  networking.wireless.userControlled.enable = true;

  networking.firewall.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    # Needed to fix login screen scaling
    dpi = 192;
    displayManager.sddm.enable = true;
    displayManager.sddm.enableHidpi = true;
    displayManager.sddm.settings = {
      Autologin = {
        user = "dpadlipsky";
        session = "hyprland";
      };
    };
  };

  users.users.dpadlipsky = {
    isNormalUser = true;
    description = "David Padlipsky";
    extraGroups = [ "networkmanager" "wheel"  "video" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    killall
    git
    gtk3
    wev
    python3
    gcc
    stdenv
    nix-index
    acpi
  ];

  programs.light.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "dpadlipsky" = import ./home.nix;
    };
  };

  # Needed for swaylock
  security.pam.services.swaylock = {};

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # ***************************************************************
  # TODO: Cannot get dGPU to work nicely, will revisit later, iGPU
  #       is good enough for most things.
  # ***************************************************************

  # boot.blacklistedKernelModules = [ "nouveau" "nv" "rivafb" "nvidiafb" "rivatv" ];

  # services.xserver.videoDrivers = ["nvidia"];

  # hardware.nvidia = {
  #   modesetting.enable = true;
  #   open = false;

  #   nvidiaSettings = true;

  #   prime = {
  #     offload = {
  #       enable = true;
  #       enableOffloadCmd = true;
  #     };
  #     intelBusId = "PCI:0:2:0";
  #     nvidiaBusId = "PCI:1:0:0";
  #   };
  # };
}
