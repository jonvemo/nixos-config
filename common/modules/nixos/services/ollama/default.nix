{pkgs,...}:
{
  services.ollama = {
    enable = true;
    loadModels = [
      "deepseek-r1:1.5b"
      "deepseek-r1:7b"
    ];
  };
  
  # environment.systemPackages = with pkgs; [
  #   /* GUI for Ollama */
  #   alpaca
  # ];
}
