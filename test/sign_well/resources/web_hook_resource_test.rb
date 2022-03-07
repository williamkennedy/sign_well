require 'test_helper'

class WebHookResourceTest < Minitest::Test
  def test_list
    stubs = stub_get_request("hooks", response: File.read("test/fixtures/hooks.json"))
    client = SignWell::Client.new(x_api_key: "key", stubs: stubs)
    response = client.list_web_hooks
    assert response.is_a?(SignWell::Response)
    assert [Hash, Array].include?(response.body.class)
    assert_equal OpenStruct, response.to_object.first.class
  end

  def test_create_hook
    body = { test_mode: true }
    stubs = stub_post_request("hooks", response: File.read("test/fixtures/create_hook.json", body: body))
    client = SignWell::Client.new(x_api_key: "key", stubs: stubs)
    response = client.create_web_hook(body)
    assert_response_body(response)
  end

  def test_delete_hook
    id = "123"
    stubs = stub_delete_request("hooks/#{id}")
    client = SignWell::Client.new(x_api_key: "key", stubs: stubs)
    response = client.delete_web_hook(id)
    assert_equal 204, response.to_object.status
  end
end


