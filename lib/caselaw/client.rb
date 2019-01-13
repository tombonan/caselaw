module Caselaw
  class Client

    attr_reader :api_key

    def initialize(settings = {})
      @api_key = settings[:api_key]
    end
  end
end
