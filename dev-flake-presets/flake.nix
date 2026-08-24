# BASIC COMMANDS FOR ESP-IDF && ARDUINO && PLATFORMIO

# compile code
# pio run

# upload code
# pio run -t upload

# upload and serial monitor
# pio run -t upload -t monitor

# generate file for LSP
# pio run -t compiledb

# run menuconfig to configure ESP family boards
# pio run -t menuconfig

{
    description = "Arduino C++ Dev Environment";
    inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    outputs =
        { self, nixpkgs }:
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in
        {
            devShells.${system}.default = pkgs.mkShell {
                buildInputs = with pkgs; [
                    platformio
                    avrdude
                    clang-tools
                ];
            };
        };
}
