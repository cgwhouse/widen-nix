{ pkgs, ... }:

{
  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader + Kernel
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # Networking
  networking.networkmanager.enable = true;
  networking.hostName = "widen-nix";

  programs.zsh.enable = true;
  environment.shells = with pkgs; [ zsh ];

  # KDE Plasma
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  users = {
    users.cristian = {
      isNormalUser = true;
      description = "Cristian Widenhouse";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };

    defaultUserShell = pkgs.zsh;

  };

  # TODO: remove
  programs.firefox.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    vim
    curl
    wget
  ];

  # VM
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;

  # Disable X11, CUPS, firewall
  services.xserver.enable = false;
  services.printing.enable = false;
  networking.firewall.enable = false;

  # Time zone + locale
  time.timeZone = "America/New_York";
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

  # Do not touch
  system.stateVersion = "25.11";
}
