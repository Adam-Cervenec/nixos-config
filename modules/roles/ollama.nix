{ pkgs, ... }:

{
  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
    loadModels = [
      "qwen2.5:14b"
    ];
    syncModels = true;
  };

  services.open-webui = {
    enable = true;

    host = "127.0.0.1";
    port = 8080;

    environment = {
      OLLAMA_BASE_URL = "http://127.0.0.1:11434";
    };
  };
}