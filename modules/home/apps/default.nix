{ lib, pkgs, cfg,... }:

#automatic import
#all files in this directory
let
  files =
    builtins.filter
      (name: name != "default.nix" && lib.hasSuffix ".nix" name)
      (builtins.attrNames (builtins.readDir ./.));
in
{
  imports = map (file: ./. + "/${file}") files;

  # install packages from profile.apps.packages
  home.packages =
  map (name: lib.attrByPath (lib.splitString "." name) null pkgs)
    cfg.profile.apps.packages;
}