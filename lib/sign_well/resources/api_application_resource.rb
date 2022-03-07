module SignWell
  class ApiApplicationResource < Resource
    def get(id, params)
      Response.new(get_request("api_applications/#{id}", params).body)
    end

    def delete(id)
      Response.new(delete_request("api_applications/#{id}"))
    end
  end
end
