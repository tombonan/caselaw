require 'httparty'

module Caselaw
  module Request
    API_ROOT = "https://api.case.law/v1/"

    def request(path)
      token = api_key || Caselaw.configuration[:api_key]

      # fail(Caselaw::ConfigurationError, "API key required.") if token.nil?

      res = HTTParty.get(API_ROOT + path, headers: {"Authorization" => token})
      puts res.parse_response

    end

    def print_test
      puts api_key
    end
  end
end
