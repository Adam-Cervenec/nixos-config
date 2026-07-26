{ lib, ... }:

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
}