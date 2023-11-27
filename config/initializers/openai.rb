Openai.configure do |config|
    config.api_key = ENV.fetch("OPENAI_API_KEY")
  end