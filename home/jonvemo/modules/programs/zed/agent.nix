let
  provider = "google";
  model = "gemini-3.1-flash-lite-preview";

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
