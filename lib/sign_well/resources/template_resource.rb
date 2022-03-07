module SignWell
  class TemplateResource < Resource
    def get(id, params)
      Response.new(get_request("document_templates/#{id}", params).body)
    end

    def create(params)
      # odd array nesting issue with the API so opting to use client.connection instead
      response = client.connection.post('document_templates') do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = params.to_json
      end
      Response.new(response.body)
    end

    def delete(id)
      Response.new(delete_request("document_templates/#{id}"))
    end
  end
end
