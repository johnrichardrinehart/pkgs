{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    mach-nix.url = "github:DavHau/mach-nix";
  };

  outputs = { self, nixpkgs, flake-utils, mach-nix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        mach-nix-lib = mach-nix.lib.${system};
      in
      rec {
        packages = {
          kraft = pkgs.callPackage ./unikraft/kraft { mach-nix = mach-nix-lib; };
        };
      }
    );
}
