require "httparty"
require "hashie"
require "pp"

module Caselaw
  module Request
    API_ROOT = "https://api.case.law/v1/"

    def request(path)
      token = api_key || Caselaw.configuration[:api_key]

      # fail(Caselaw::ConfigurationError, "API key required.") if token.nil?

      res = HTTParty.get(API_ROOT + path, headers: {"Authorization" => token})
      parsed_response(res)
    end

    def parsed_response(res)
      pp res.parsed_response
    end
  end
end
