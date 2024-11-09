{
  description = "Note-management scripts for the 70s.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin"];
    forAllSystems = f:
      nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    lrk = pkgs:
      pkgs.stdenv.mkDerivation {
        pname = "lrk";
        version = "1.0.0";
        src = ./.;
        nativeBuildInputs = with pkgs; [bash];

        buildPhase = ''
          mkdir -p $out/bin/commands
          cp lrk $out/bin/
          cp commands/*.sh $out/bin/commands
        '';

        installPhase = ''
          chmod +x $out/bin/*
        '';

        meta = with pkgs.lib; {
          mainProgram = "lrk";
          description = "Note-management scripts for the 70s.";
          license = licenses.wtfpl;
        };
      };
  in {
    formatter = forAllSystems (pkgs: pkgs.alejandra);

    packages = forAllSystems (pkgs: {
      default = lrk pkgs;
      lrk = lrk pkgs;
    });

    apps = forAllSystems (pkgs: {
      default = {
        type = "app";
        program = pkgs.lib.getExe (lrk pkgs);
      };
    });
  };
}
