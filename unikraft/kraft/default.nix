{ stdenv, lib, fetchFromGitHub, ncurses, libyaml, flex, git, wget, socat, bison, unzip, libuuid, python39, python39Packages, mach-nix }:
let
  rev = "a8ac3e37e422850c569b004034bbad0e644acb62";

  # https://thomazleite.com/posts/development-with-nix-python/
  self = mach-nix.buildPythonApplication {
    version = rev;

    nativeBuildInputs = [ git ];

    src = fetchFromGitHub {
      owner = "unikraft";
      repo = "kraft";

      inherit rev;
      sha256 = "6WWxl7JQuBRTj8zC7Ckn4v7uO4CE65nD6kGn2ETA5n0=";

      leaveDotGit = true;
    };
  };
in
self
