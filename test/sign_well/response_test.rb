require 'test_helper'

class ResponseTest < MiniTest::Test
  def test_to_ostruct
    body = File.read('test/fixtures/example_json.json')
    response = SignWell::Response.new(JSON.parse(body))
    assert response.to_object.is_a?(OpenStruct)
    assert response.body.is_a?(Hash)
  end
end
