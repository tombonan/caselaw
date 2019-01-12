module Caselaw
  class Client
    include Caselaw::Request

    attr_reader :api_key

    def initialize(settings = {})
      @api_key = settings[:api_key]
    end
  end
end
