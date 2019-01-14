module Caselaw
  module Cases
    API_ENDPOINT = "cases/"

    def case(id, full_case = false)
      id_path = id.to_s
      path = API_ENDPOINT + id_path unless full_case == true
      path = API_ENDPOINT + id_path + "?full_case=true" if full_case == true
      data = request(path)
    end
  end
end
