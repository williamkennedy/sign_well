module SignWell
  class Client
    attr_reader :x_api_key, :stubs
    BASE_URL = 'https://www.signwell.com/api/v1'

    def initialize(x_api_key:, stubs: nil)
      @x_api_key = x_api_key
      @stubs = stubs
    end

    def document(id, params = {})
      DocumentResource.new(self).get(id, params)
    end

    def create_document(params)
      DocumentResource.new(self).create(params)
    end

    def create_document_from_template(params)
      DocumentResource.new(self).create_from_template(params)
    end

    def update_and_send_document(id, params)
      DocumentResource.new(self).update_and_send_document(id, params)
    end

    def delete_document(id)
      DocumentResource.new(self).delete(id)
    end

    def completed_pdf(id, params)
      DocumentResource.new(self).completed_pdf(id, params)
    end

    def remind_document(id, params = {})
      DocumentResource.new(self).remind(id, params)
    end

    def template(id, params = {})
      TemplateResource.new(self).get(id, params)
    end

    def create_template(params)
      TemplateResource.new(self).create(params)
    end

    def delete_template(id)
      TemplateResource.new(self).delete(id)
    end

    def api_application(id, params = {})
      ApiApplicationResource.new(self).get(id, params)
    end

    def delete_api_application(id)
      ApiApplicationResource.new(self).delete(id)
    end

    def list_web_hooks
      WebHookResource.new(self).list
    end

    def create_web_hook(params)
      WebHookResource.new(self).create(params)
    end

    def delete_web_hook(id)
      WebHookResource.new(self).delete(id)
    end

    def me
      MeResource.new(self).get
    end

    def connection
      @connection ||= Faraday.new(url: BASE_URL) do |conn|
        conn.headers['X-Api-Key'] = x_api_key
        conn.response :json, content_type: 'application/json'
        if @stubs
          conn.adapter :test, @stubs
        end
      end
    end
  end
end
