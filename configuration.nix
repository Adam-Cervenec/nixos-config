{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  

  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # --- System ---

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Prague";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "cs_CZ.UTF-8";
    LC_IDENTIFICATION = "cs_CZ.UTF-8";
    LC_MEASUREMENT = "cs_CZ.UTF-8";
    LC_MONETARY = "cs_CZ.UTF-8";
    LC_NAME = "cs_CZ.UTF-8";
    LC_NUMERIC = "cs_CZ.UTF-8";
    LC_PAPER = "cs_CZ.UTF-8";
    LC_TELEPHONE = "cs_CZ.UTF-8";
    LC_TIME = "cs_CZ.UTF-8";
  };


  # --- DEs ---

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable Qtile DE VM
  services.xserver.windowManager.qtile.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


  # --- Periferies ---

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


  # --- user ---

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.user = {
    isNormalUser = true;
    description = "user";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };


  # --- SW ---

  # Install firefox.
  # programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [  ];


  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;


  # --- Firewall ---

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  networking.firewall.enable = true;


  # --- OS version ---

  system.stateVersion = "25.11"; # Did you read the comment?


  # --- GPU ---
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = false;
    nvidiaSettings = true;
  };
}
