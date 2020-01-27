import ((import <nixpkgs> { }).fetchFromGitHub {
  owner = "dailykos";
  repo = "nixpkgs";
  rev = "9bbad4c6254513fa62684da57886c4f988a92092";
  sha256 = "00dhkkmar3ynfkx9x0h7hzjpcqvwsfmgz3j0xj80156kbw7zq4bb";
}) {

  config.allowUnfree = true;
  overlays = import ../overlays;
}
