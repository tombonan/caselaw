module Caselaw
  module Jurisdictions
    API_ENDPOINT = "jurisdictions/"

    # Return all Jurisdictions
    def search_jurisdictions
      Hashie::Mash.new(request(API_ENDPOINT))
    end

    def jurisdiction(jurisdiction_term)
      slug = slug(jurisdiction_term)
      path = API_ENDPOINT + slug
      Hashie::Mash.new(request(path))
    end
  end
end
