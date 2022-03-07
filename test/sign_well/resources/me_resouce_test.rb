require 'test_helper'

class MeResourceTest < Minitest::Test
  def test_get
    stubs = stub_get_request("me", response: File.read("test/fixtures/me.json"))
    client = SignWell::Client.new(x_api_key: "key", stubs: stubs)
    response = client.me
    assert_response_body(response)
  end
end


