module Caselaw
  module Cases
    API_ENDPOINT = "cases/"

    def case(id, full_case = false)
      id_path = id.to_s
      path = API_ENDPOINT + id_path
      path = path + "?full_case=true" if full_case == true
      Hashie::Mash.new(request(path))
    end

    def cases_by_jurisdiction_id(jurisdiction_id, num_cases, full_case = false)
      slug = Caselaw::Jurisdiction.get_by_id(jurisdiction_id)
      
      path = API_ENDPOINT + "?jurisdiction=" + slug
      path = path + "&full_case=true" if full_case == true
      Hashie::Mash.new(request(path)) #add pagination request
    end

    def cases_by_jurisdiction_name(jurisdiction_name, num_cases, full_case = false)
      slug = Caselaw::Jurisdiction.get_by_name(jurisdiction_name)
      
      path = API_ENDPOINT + "?jurisdiction=" + slug
      path = path + "&full_case=true" if full_case == true
      Hashie::Mash.new(request(path)) #add pagination request
    end

    # Search through text of cases and return cases that contain the word
    def search_cases(term, num_cases)
      
    end

    def search_cases_by_jurisdiction_id(term, num_cases, jurisdiction_id)
      slug = Caselaw::Jurisdiction.get_by_id(jurisdiction_id)
      
    end

    def search_cases_by_jurisdiction_name(term, num_cases, jurisdiction_name)
      slug = Caselaw::Jurisdiction.get_by_name(jurisdiction_name)
    end
  end
end
