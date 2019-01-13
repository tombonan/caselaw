module Caselaw
  module Jurisdictions
    def jurisdiction_by_name
      path = 'jurisdictions/ala'
      request(path)
    end
  end
end
