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

    def update_and_send_document(id, params)
      Response.new(post_request("documents/#{id}/send", params).body)
    end

    def delete(id)
      Response.new(delete_request("documents/#{id}"))
    end

    def completed_pdf(id, params)
      Response.new(get_request("documents/#{id}/completed_pdf", params).body)
    end

    def remind(id, params)
      Response.new(post_request("documents/#{id}/remind", params).body)
    end
  end
end
