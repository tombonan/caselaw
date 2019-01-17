require "caselaw/client"
require "caselaw/client/cases"
require "caselaw/client/citations"
require "caselaw/client/courts"
require "caselaw/client/jurisdictions"
require "caselaw/client/reporters"
require "caselaw/client/volumes"

module Caselaw
  class Client
    include Caselaw::Request
    include Caselaw::Cases
    include Caselaw::Citations
    include Caselaw::Courts
    include Caselaw::Jurisdictions
    include Caselaw::Reporters
    include Caselaw::Volumes
    
    attr_reader :api_key

    def initialize(settings = {})
      fail(ArgumentError, "API key hash is required.") unless settings.is_a?(Hash)
      @api_key = settings[:api_key]
    end
  end
end
