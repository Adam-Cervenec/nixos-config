{
    pkgs,
    ...
}:

{

    home.packages = with pkgs; [
        platformio
        avrdude
        clang-tools
    ];
}
