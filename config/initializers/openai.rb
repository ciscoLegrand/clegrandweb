OpenAI.configure do |config|
  config.access_token = Figaro.env.openai_api_key
  # config.organization_id = ENV.fetch("OPENAI_ORGANIZATION_ID") # Optional.
end
