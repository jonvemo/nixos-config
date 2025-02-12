{
  enabled = true;
  default_width = 384;
  dock = "right";
  version = "2";

  default_model = {
    provider = "google";            # ollama
    model = "gemini-2.0-flash-thinking-exp"; # deepseek-r1:1.5b/7b
  };
  inline_alternatives = [
    {
      provider = "openai";
      model = "o3-mini";
    }
  ];
  
}
