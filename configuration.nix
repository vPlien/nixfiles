{ config, pkgs, ... }:

{
 

###########################################################################################
################################ Auto-generated configuration #############################
###########################################################################################


 imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "kin"; # Define your hostname.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.wlp2s0.useDHCP = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gnome3";
  };

  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.plien = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.03"; # Did you read the comment?


###########################################################################################
################################ Personal Configuration ###################################
###########################################################################################


################################## Networking #############################################

networking.networkmanager.enable = true;
networking.networkmanager.packages = with pkgs; [
  networkmanager_dmenu
];

################################### Security ##############################################

security.sudo.wheelNeedsPassword = false;

#################################### Shell ################################################

programs.zsh.enable = true;
programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

################################## X Server ###############################################

environment.pathsToLink = [ "/libexec" ];

services.autorandr.enable = true;
services.picom.enable = true;

services.xserver.xautolock.enable = true;
services.xserver.xautolock.locker = "${pkgs.i3lock-color}/bin/i3lock-color -i /home/plien/.config/awesome/themes/background.jpg";
services.xserver.xautolock.nowlocker = "${pkgs.i3lock-color}/bin/i3lock-color -i /home/plien/.config/awesome/themes/background.jpg";


services.xserver.displayManager = {
  lightdm.enable = true;
  lightdm.greeters.gtk.enable = true;
  defaultSession = "none+awesome";
};

services.xserver.windowManager = {
  awesome.enable = true;
  xmonad.enable = true;
};

############################ Programs and Packages ########################################

fonts.fonts = with pkgs; [
  font-awesome
];

programs.tmux.enable = true;
programs.npm.enable = true;

environment.systemPackages = with pkgs; [
  wget
  vim
  git
  gitAndTools.gh
  alacritty
  lf
  ranger
  htop
  navi
  manix
  bashmount
  nitrogen
  lynx
  firefox
  zathura
  pavucontrol
  arandr
  xfce.xfce4-power-manager
  i3lock-color
];

}

