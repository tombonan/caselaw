require "caselaw/client"
require "caselaw/client/jurisdictions"

module Caselaw
  class Client
    include Caselaw::Request
    # include Caselaw::Jurisdictions
    
    attr_reader :api_key

    def initialize(settings = {})
      # fail(ArgumentError, "API key hash required.") unless options.is_a?(Hash)
      
      @api_key = settings[:api_key]
    end
  end
end
