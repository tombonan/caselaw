require "httparty"
require "hashie"

module Caselaw
  module Request
    API_ROOT = "https://api.case.law/v1/"

    def request(path)
      token = api_key || Caselaw.configuration[:api_key]
      fail(Caselaw::ConfigurationError, "API key is required.") if token.nil?

      res = HTTParty.get(API_ROOT + path, headers: {"Authorization" => "Token " + token})
      parsed_response(res)
    end

    def paginated_request(path)
      token = api_key || Caselaw.configuration[:api_key]
      fail(Caselaw::ConfigurationError, "API key is required.") if token.nil?
    end

    def parsed_response(res)
      res.parsed_response
    end
  end
end
