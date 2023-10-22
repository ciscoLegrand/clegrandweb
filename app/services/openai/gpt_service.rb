module Openai
  class GptService
    include HTTParty

    attr_reader :api_url, :options, :model, :max_tokens, :temperature, :context

    def initialize(config = {})
      api_key = Figaro.env.openai_api_key
      @options = {
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => "Bearer #{api_key}"
        }
      }
      @api_url = 'https://api.openai.com/v1/chat/completions'
      @model = config[:model] || 'gpt-3.5-turbo'
      @max_tokens = config[:max_tokens] || 50
      @temperature = config[:temperature] || 0.7
      @context = config[:context] || nil
    end

    def call(messages)
      body = {
        model: @model,
        messages: messages,
        max_tokens: @max_tokens,
        temperature: @temperature
      }
      response = HTTParty.post(api_url, body: body.to_json, headers: options[:headers], timeout: 180)

      raise "🤦🤦 Sorry, I understand 🤦\n#{response['error']['message']}" unless response.code == 200

      puts response

      text = response.dig('choices', 0, 'message', 'content')
      raise "Unexpected response format" if text.nil?

      text.strip
    end
  end
end

