{ config, pkgs, ... }:

{
	programs.home-manager.enable = true;
	home.username = "cristian";
	home.homeDirectory = "/home/cristian";

	home.packages = [
		pkgs.fastfetch
	];

	programs.git = {
		enable = true;
		settings.user = {
			name = "Cristian Widenhouse";
			email = "cgwidenhouse@gmail.com";
		};

	};

# Do not touch
	home.stateVersion = "25.11";
}
