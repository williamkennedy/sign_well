# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "sign_well"

require "minitest/autorun"
require "faraday"
require 'json'

class MiniTest::Test
  def stub_get_request(path, response:)
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get("/api/v1/#{path}") do |env|
        [200, {'Content-Type': "application/json"}, response]
      end
    end
  end

  def stub_post_request(path, response:, body: {})
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post("/api/v1/#{path}", **body) do |env|
        [201, {'Content-Type': "application/json"}, response]
      end
    end
  end

  def stub_patch_request(path, response:,body: {})
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.patch("/api/v1/#{path}", **body) do |env|
        [201, {'Content-Type': "application/json"}, response]
      end
    end
  end

  def stub_delete_request(path)
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.delete("/api/v1/#{path}") do |env|
        [204, {'Content-Type': "application/json"}]
      end
    end
  end

  def assert_response_body(response)
    assert response.is_a?(SignWell::Response)
    assert_equal Hash, response.body.class
    assert_equal OpenStruct, response.to_object.class
  end
end
