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

    def slug(jurisdiction_term)
      if jurisdiction_term.is_a?(String)
        slug = Caselaw::Jurisdiction.get_by_name(jurisdiction_term)
      elsif jurisdiction_term.is_a?(Integer)
        slug = Caselaw::Jurisdiction.get_by_id(jurisdiction_term)
      end
    end
  end
end
