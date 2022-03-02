module SignWell
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end


    private

    def get_request(path, params)
      client.connection.get(path, params)
    end

    def post_request(path, params)
      client.connection.post(path) do |req|
        req.params = params
        req.headers['Content-Type'] = 'application/json'
      end
    end
  end
end
