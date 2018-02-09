# generated using pypi2nix tool (version: 1.8.0)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -r requirements-dev.txt -V3 -E python3Packages.argparse
#

{ pkgs ? import <nixpkgs> {}
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell;

  pythonPackages =
  import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv;
    python = pkgs.python3;
  };

  commonBuildInputs = with pkgs; [ python3Packages.argparse ];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreter = pythonPackages.buildPythonPackage {
        name = "python3-interpreter";
        buildInputs = [ makeWrapper ] ++ (builtins.attrValues pkgs);
        buildCommand = ''
          mkdir -p $out/bin
          ln -s ${pythonPackages.python.interpreter}               $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "               (builtins.attrValues pkgs)}; do
            if [ -d "$dep/bin" ]; then
              for prog in "$dep/bin/"*; do
                if [ -f $prog ]; then
                  ln -s $prog $out/bin/`basename $prog`
                fi
              done
            fi
          done
          for prog in "$out/bin/"*; do
            wrapProgram "$prog" --prefix PYTHONPATH : "$PYTHONPATH"
          done
          pushd $out/bin
          ln -s ${pythonPackages.python.executable} python
          popd
        '';
        passthru.interpreter = pythonPackages.python;
      };
    in {
      __old = pythonPackages;
      inherit interpreter;
      mkDerivation = pythonPackages.buildPythonPackage;
      packages = pkgs;
      overrideDerivation = drv: f:
        pythonPackages.buildPythonPackage (drv.drvAttrs // f drv.drvAttrs);
      withPackages = pkgs'':
        withPackages (pkgs // pkgs'');
    };

  python = withPackages {};

  generated = self: {

    "argparse" = python.mkDerivation {
      name = "argparse-1.4.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/18/dd/e617cfc3f6210ae183374cd9f6a26b20514bbb5a792af97949c5aacddf0f/argparse-1.4.0.tar.gz"; sha256 = "62b089a55be1d8949cd2bc7e0df0bddb9e028faefc8c32038cc84862aefdd6e4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.psfl;
        description = "Python command-line parsing library";
      };
    };



    "mock" = python.mkDerivation {
      name = "mock-2.0.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/0c/53/014354fc93c591ccc4abff12c473ad565a2eb24dcd82490fae33dbf2539f/mock-2.0.0.tar.gz"; sha256 = "b158b6df76edd239b8208d481dc46b6afd45a846b7812ff0ce58971cf5bc8bba"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pbr"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Rolling backport of unittest.mock for all Pythons";
      };
    };



    "nose" = python.mkDerivation {
      name = "nose-1.3.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/58/a5/0dc93c3ec33f4e281849523a5a913fa1eea9a3068acfa754d44d88107a44/nose-1.3.7.tar.gz"; sha256 = "f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.lgpl2;
        description = "nose extends unittest to make testing easier";
      };
    };



    "pbr" = python.mkDerivation {
      name = "pbr-3.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d5/d6/f2bf137d71e4f213b575faa9eb426a8775732432edb67588a8ee836ecb80/pbr-3.1.1.tar.gz"; sha256 = "05f61c71aaefc02d8e37c0a3eeb9815ff526ea28b3b76324769e6158d7f95be1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Python Build Reasonableness";
      };
    };



    "sh" = python.mkDerivation {
      name = "sh-1.12.14";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/7c/71/199d27d3e7e78bf448bcecae0105a1d5b29173ffd2bbadaa95a74c156770/sh-1.12.14.tar.gz"; sha256 = "b52bf5833ed01c7b5c5fb73a7f71b3d98d48e9b9b8764236237bdc7ecae850fc"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "Python subprocess replacement";
      };
    };



    "six" = python.mkDerivation {
      name = "six-1.11.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"; sha256 = "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };

  };
  overrides = import ./requirements_override.nix { inherit pkgs python; };
  commonOverrides = [

  ];

in python.withPackages
   (fix' (pkgs.lib.fold
            extends
            generated
            ([overrides] ++ commonOverrides)
         )
   )