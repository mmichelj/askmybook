OpenAI.configure do |config|
  config.access_token = Rails.application.credentials.OPENAI_API_KEY
end