{ pkgs, ... }:
{
  system = {
    stateVersion = 5;
    primaryUser = "ahrzb";
  };
  # Installed with the pre-2024 installer, which used GID 30000.
  ids.gids.nixbld = 30000;

  environment.systemPackages = [ pkgs.kitty ];

  fonts.packages = with pkgs; [
    samim-fonts
    vazirmatn
    shabnam-fonts
    sahel-fonts
    parastoo-fonts
    recursive
  ];
}
