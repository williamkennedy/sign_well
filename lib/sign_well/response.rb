require "ostruct"

module SignWell
  class SignWell::Response
    attr_reader :body

    def initialize(body)
      @body = body
    end

    def to_object
      to_ostruct(body)
    end

    private

    def to_ostruct(body)
      if body.is_a?(Hash)
        OpenStruct.new(body.map { |key, val| [key, to_ostruct(val)] }.to_h)
      elsif body.is_a?(Array)
        body.map { |o| to_ostruct(o) }
      else 
        body
      end
    end
  end
end

