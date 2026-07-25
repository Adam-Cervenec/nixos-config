{ config, pkgs, device, lib, ... }:

#define variables for paths in device.nix
let
  inherit (device) apps modules ; # device.nix variables

  install = apps.install or []; # list of packages to install\

  # method to get package from pkgs by path, throws error if not found
  getInstall = path:
    let
      pkg = lib.attrByPath (lib.splitString "." path) null pkgs;
    in
      if pkg == null then
        throw "Package '${path}' does not exist."
      else
        pkg;

  #automatic file reader from this folder level
  dir = builtins.readDir ./.;
  files = builtins.filter
    (name:
      dir.${name} == "regular"
      && name != "default.nix"
      && lib.hasSuffix ".nix" name
    )
    (builtins.attrNames dir);
in
{
  # import all files to this module 
  imports = map (file: ./. + "/${file}") files;

  # install packages defined in device.nix
  home.packages = map getInstall install;

}