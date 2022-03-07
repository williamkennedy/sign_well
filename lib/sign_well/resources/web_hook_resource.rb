module SignWell
  class WebHookResource < Resource
    def list(params={})
      Response.new(get_request("hooks", params).body)
    end

    def create(params)
      Response.new(post_request("hooks", params).body)
    end

    def delete(id)
      Response.new(delete_request("hooks/#{id}"))
    end
  end
end
