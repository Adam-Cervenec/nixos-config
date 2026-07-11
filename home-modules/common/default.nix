{ config, pkgs, device, lib, ... }:

#define variables for paths in device.nix
let
  inherit (device) apps modules ;
  install = apps.install or [];
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
  imports = map (file: ./. + "/${file}") files;

  home.packages = map getInstall install;

}