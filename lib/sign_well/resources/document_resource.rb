module SignWell
  class DocumentResource < Resource
    def get(id, params)
      Response.new(get_request("documents/#{id}",params).body)
    end

    def create(params)
      Response.new(post_request("documents", params).body)
    end

    def create_from_template(params)
      Response.new(post_request("document_templates/documents", params).body)
    end
  end
end
