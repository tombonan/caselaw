module Caselaw
  module Cases
    API_ENDPOINT = "cases/"

    def case(id, full_case = false)
      id_path = id.to_s
      path = API_ENDPOINT + id_path unless full_case == true
      path = API_ENDPOINT + id_path + "?full_case=true" if full_case == true
      Hashie::Mash.new(request(path))
    end

    def cases_by_jurisdiction_id(jurisdiction_id, full_case = false)
      slug = Caselaw::Jurisdiction.get_by_id(jurisdiction_id)
      
      path = API_ENDPOINT + "?jurisdiction=" + slug unless full_case == true
      path = API_ENDPOINT + "?jurisdiction=" + slug + "&full_case=true" if full_case == true
      Hashie::Mash.new(request(path)) #add pagination request
    end

    def cases_by_jurisdiction_name(jurisdiction_name, full_case = false)
      slug = Caselaw::Jurisdiction.get_by_name(jurisdiction_name)
      
      path = API_ENDPOINT + "?jurisdiction=" + slug unless full_case == true
      path = API_ENDPOINT + "?jurisdiction=" + slug + "&full_case=true" if full_case == true
      Hashie::Mash.new(request(path)) #add pagination request
    end
  end
end
