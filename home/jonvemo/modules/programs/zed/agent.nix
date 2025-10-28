# NOTE
#   Preferred Providers and Models
#     google       :    gemini-2.5-pro, gemini-2.5-flash
#     ollama       :    deepseek-r1:1.5b, deepseek-r1:7b
#

let
  provider = "google";
  model = "gemini-2.5-flash";

in {
  enabled = true;
  dock = "right";
  default_width = 384;
  preferred_completion_mode = "normal";

  default_model = {
    provider = provider;
    model = model;
  };
  commit_message_model = {
    provider = provider;
    model = model;
  };
  thread_summary_model = {
    provider = provider;
    model = model;
  };
  inline_assistant_model = {
    provider = provider;
    model = model;
  };

}
