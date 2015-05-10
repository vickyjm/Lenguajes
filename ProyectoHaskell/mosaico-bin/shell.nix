let
  pkgs = import <nixpkgs> {};
  haskellPackages = pkgs.myHaskellPackages.override {
    extension = self: super: {
      mosaicoBin = pkgs.myHaskellPackages.callPackage ./. {};
    };
  };

in
  pkgs.lib.overrideDerivation haskellPackages.mosaicoBin (attrs: {
    buildInputs = [ haskellPackages.cabalInstall ] ++ attrs.buildInputs;
  })
