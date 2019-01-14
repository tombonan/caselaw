module Caselaw
  module Jurisdictions
    API_ENDPOINT = "jurisdictions/"

    # Return all Jurisdictions
    def search_jurisdictions
      Hashie::Mash.new(request(API_ENDPOINT))
    end

    def jurisdiction_by_name(name)
      slug = Caselaw::Jurisdiction.get_by_name(name)
      path = API_ENDPOINT + slug
      Hashie::Mash.new(request(path))
    end

    def jurisdiction(id)
      slug = Caselaw::Jurisdiction.get_by_id(id)
      path = API_ENDPOINT + slug
      Hashie::Mash.new(request(path))
    end
  end
end
