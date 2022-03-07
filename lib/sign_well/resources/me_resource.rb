module SignWell
  class MeResource < Resource
    def get
      Response.new(get_request('me', {}).body)
    end
  end
end
