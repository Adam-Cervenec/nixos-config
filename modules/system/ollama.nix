{ pkgs, cfg, lib, ... }:
let
  cfgOllama = cfg.profile.ollama or {};
in
lib.mkIf (cfgOllama.enable or false) {
  # Ollama -> local LLM backend
  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
    loadModels = [
      "qwen2.5:14b"
      "qwen3:8b"
      "thirdeyeai/DeepSeek-R1-Distill-Qwen-7B-uncensored:Q4_0"
    ];
    syncModels = true;
  };

  # Open WebUI -> local web frontend
  # open http://localhost:8080/ in browser
  services.open-webui = {
    enable = true;

    host = "127.0.0.1";
    port = 8080;

    environment = {
      OLLAMA_BASE_URL = "http://127.0.0.1:11434";

      ENABLE_WEB_SEARCH = "true";
      WEB_SEARCH_ENGINE = "searxng";
      SEARXNG_QUERY_URL = "http://127.0.0.1:8888/search?q=<query>&format=json";
      WEB_SEARCH_RESULT_COUNT = "10";
      SEARXNG_LANGUAGE = "all";
    };
  };

  # web search
  services.searx = {
    enable = true;

    settings = {
      server = {
        bind_address = "127.0.0.1";
        port = 8888;
        secret_key = "tohle_je_jen_docasny_testovaci_klic_zmenim_ho";
      };
      search = {
        formats = [
          "html"
          "json"
          "csv"
          "rss"
        ];
      };
    };
  };
}