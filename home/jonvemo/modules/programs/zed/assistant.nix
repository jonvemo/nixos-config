# NOTE
#   Preferred Providers and Models
#     zed.dev      :    claude-3-7-sonnet-latest, claude-3-7-sonnet-thinking-latest
#     google       :    gemini-2.0-flash-thinking-exp, gemini-2.5-pro-exp-03-25, gemini-2.0-flash
#     copilot_chat :    gpt-4o, gpt-4
#     ollama       :    deepseek-r1:1.5b, deepseek-r1:7b
#

let
  main-provider = "google";
  main-model = "gemini-2.5-flash-preview-04-17";
  
in {
  enabled = true;
  default_width = 384;
  dock = "right";
  version = "2";

  default_model = {
    provider = main-provider;
    model = main-model;
  };
  editor_model = {
    provider = main-provider;
    model = main-model;
  };
  inline_assistant_model = {
    provider = main-provider;
    model = main-model;
  };
  commit_message_model = {
    provider = main-provider;
    model = main-model;
  };
  thread_summary_model = {
    provider = main-provider;
    model = main-model;
  };
  
  inline_alternatives = [
    {
      provider = "zed.dev";
      model = "claude-3-7-sonnet-lastest";
    }
  ];
  
}
