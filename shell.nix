{ nixpkgs ? import ./z/etc/lib/nixpkgs.nix }:
let
  inherit (nixpkgs) pkgs;

  inherit (pkgs) stdenv bundlerEnv ruby;

  pname = "dailykos-project-env";

  appRoot = builtins.toPath ./.;

  rubyEnv = bundlerEnv {
    name = "dailykos-project";
    inherit ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };
in stdenv.mkDerivation {
  name = "${pname}";
  buildInputs = with pkgs; [
    rubyEnv
    bundix
    ruby
    rubocop
    nix
    readline
    taskjuggler
  ];
}
