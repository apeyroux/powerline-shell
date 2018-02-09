{ }:

let
  pkgs = import <nixpkgs> {};
  python = import ./requirements.nix { inherit pkgs; };
in python.mkDerivation {
  name = "powerline-shell-0.4.8";
  src = ./.;
  buildInputs = [
    python.packages."nose"
    python.packages."mock"
    python.packages."sh"
    python.packages."argparse"
  ];
  propagatedBuildInputs = [
    python.packages."nose"
    python.packages."mock"
    python.packages."sh"
    python.packages."argparse"
  ];
}
