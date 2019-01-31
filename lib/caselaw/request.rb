require "httparty"
require "hashie"

module Caselaw
  module Request
    API_ROOT = "https://api.case.law/v1/"

    def request(path)
      token = api_key || Caselaw.configuration[:api_key]
      fail(Caselaw::ConfigurationError, "API key is required.") if token.nil?

      res = HTTParty.get(API_ROOT + path, headers: {"Authorization" => "Token " + token}) 
        case res.code
        when 200
          parsed_response(res)
        when 404
          fail(Caselaw::NotFound)
        end
    end

    def paginated_request(path, num)
      token = api_key || Caselaw.configuration[:api_key]
      fail(Caselaw::ConfigurationError, "API key is required.") if token.nil?

      count = 0
      pageCount = 1
      nextPageExists = true
      tempArray = []
      path = API_ROOT + path
      
      initialRes = HTTParty.get(path, headers: {"Authorization" => "Token " + token})
      initialRes = initialRes.parsed_response

      while nextPageExists && count <= num
        puts "-- | Page " + pageCount.to_s
        res = HTTParty.get(path, headers: {"Authorization" => "Token " + token})
        res = res.parsed_response
        data = res['results']
        
        count += data.count
        pageCount += 1
        tempArray.push(*data)
        res['next'] != nil ? path = res['next'] : nextPageExists = false
      end
      tempArray = tempArray[0, num] if tempArray.count > num
      tempArray
    end

    def parsed_response(res)
      res.parsed_response
    end

    def slug(jurisdiction_term)
      if jurisdiction_term.is_a?(String)
        Caselaw::Jurisdiction.get_by_name(jurisdiction_term)
      elsif jurisdiction_term.is_a?(Integer)
        Caselaw::Jurisdiction.get_by_id(jurisdiction_term)
      end
    end
  end
end
