{
  description = "My CV as a Nix flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

#  outputs = { self, nixpkgs, flake-utils, }: flake-utils.lib.eachDefaultSystem (system: {
  outputs = { self, nixpkgs, flake-utils, ... }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      cv = pkgs.stdenv.mkDerivation rec {
        pname = "romatthe-cv";
        version = "1.0.0";
        src = "./";
        buildInputs = [ pkgs.tectonic ];
        buildPhase = ''
          tectonic cv-alt.tex
        '';        
        installPhase = ''
          cp -r cv-alt.pdf $out
        '';
      };
    in  
      {
        overlay = final: prev: {
          personal = {
            cv = prev.cv;
          };
        };
        
        defaultPackage.x86_64-linux = cv;

        packages.x86_64-linux.cv = cv;
      
        devShell.x86_64-linux = pkgs.mkShell {
          buildInputs = [
            pkgs.tectonic
          ];
        };
      };
}
