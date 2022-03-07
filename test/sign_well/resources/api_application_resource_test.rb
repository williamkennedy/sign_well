require 'test_helper'

class DocumentResourceTest < Minitest::Test
  def test_get
    id = "123"
    stubs = stub_get_request("api_applications/#{id}", response: File.read("test/fixtures/api_application.json"))
    client = SignWell::Client.new(x_api_key: "key", stubs: stubs)
    response = client.api_application(id)
    assert_response_body(response)
  end

  def test_delete_api_application
    id = "123"
    stubs = stub_delete_request("api_applications/#{id}")
    client = SignWell::Client.new(x_api_key: "key", stubs: stubs)
    response = client.delete_api_application(id)
    assert_equal 204, response.to_object.status
  end
end


