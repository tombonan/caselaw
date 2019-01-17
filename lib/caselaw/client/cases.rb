module Caselaw
  module Cases
    API_ENDPOINT = "cases/"

    def case(id, full_case = false)
      id_path = id.to_s
      path = API_ENDPOINT + id_path
      path = path + "?full_case=true" if full_case == true
      Hashie::Mash.new(request(path))
    end

    def cases_by_jurisdiction(jurisdiction_term, num_cases, full_case = false)
      slug = Caselaw::Jurisdiction.get_by_name(jurisdiction_term) if jurisdiction_term.is_a?(String)
      slug = Caselaw::Jurisdiction.get_by_id(jurisdiction_term) if jurisdiction_term.is_a?(Integer)
      path = API_ENDPOINT + "?jurisdiction=" + slug

      path = path + "&full_case=true" if full_case == true
      Hashie::Mash.new(request(path)) #add pagination request
    end

    # Search through text of cases and return cases that contain the word
    def search_cases(term, num_cases, jurisdiction_term=nil)
      if jurisdiction_term.is_a?(String)
        slug = Caselaw::Jurisdiction.get_by_name(jurisdiction_term)
        path = API_ENDPOINT + "?search=" + term + "&jurisdiction=" + slug
      elsif jurisdiction_term.is_a?(Integer)
        slug = Caselaw::Jurisdiction.get_by_id(jurisdiction_term)
        path = API_ENDPOINT + "?search=" + term + "&jurisdiction=" + slug
      else
        path = API_ENDPOINT + "?search=" + term
      end
      Hashie::Mash.new(request(path)) #add pagination request
    end
  end
end
