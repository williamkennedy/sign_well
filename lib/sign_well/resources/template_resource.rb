module SignWell
  class TemplateResource < Resource
    def get(id, params)
      Response.new(get_request("document_templates/#{id}", params).body)
    end

    def create(params)
      Response.new(post_request("document_templates", params).body)
    end
  end
end
