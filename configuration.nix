#configuration.nix

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./global-modules/system.nix
      #./global-modules/software.nix
      #./global-modules/gui.nix
      #./global-modules/gpu.nix
      #./global-modules/periferies/audio.nix
      #./global-modules/periferies/printers.nix
      #./global-modules/network/firewall.nix
      #./global-modules/network/network.nix
      #./global-modules/network/wireless.nix
    ];
  

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  

  # --- Network ---

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager = {
    enable = true;
    dns = "dnsmasq";
  };

  # due to steam low speed download
  services.dnsmasq = {
    enable = true;

    settings = {
      "listen-address" = "127.0.0.1";
      "no-resolv"      = true;
      "port"           = 0;
      "server"         = [ "1.1.1.1" "8.8.8.8" "8.8.4.4" ];
    };
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
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];

  };

  users.users.user.shell = pkgs.zsh;
  programs.zsh.enable = true;

  # --- SW ---

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ 
    
   ];


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

  # --- Steam ---

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;


  programs.gamemode.enable = true;


}
