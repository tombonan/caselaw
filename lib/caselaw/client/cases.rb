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
      slug = slug(jurisdiction_term)
      path = API_ENDPOINT + "?jurisdiction=" + slug
      path = path + "&full_case=true" if full_case == true
      tempArray = paginated_request(path, num_cases)
      Hashie::Mash.new(resultsCount: tempArray.count, results: tempArray)
    end

    # Search through text of cases and return cases that contain the word
    def search_cases(term, num_cases, jurisdiction_term=nil)
      if jurisdiction_term != nil
        slug = slug(jurisdiction_term)
        path = API_ENDPOINT + "?search=" + term + "&jurisdiction=" + slug
      else
        path = API_ENDPOINT + "?search=" + term
      end
      tempArray = paginated_request(path, num_cases)
      Hashie::Mash.new(resultsCount: tempArray.count, results: tempArray)
    end
  end
end
