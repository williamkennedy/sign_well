require 'test_helper'

class DocumentResourceTest < Minitest::Test
  def test_get
    id = "123"
    stubs = stub_get_request("document_templates/#{id}", response: File.read("test/fixtures/template.json"))
    client = SignWell::Client.new(x_api_key: "key", stubs: stubs)
    response = client.template(id)
    assert_response_body(response)
  end

  def test_create
    body = {test_mode: true }
    stubs = stub_post_request("document_templates", response: File.read("test/fixtures/create_template.json"), body: body)
    client = SignWell::Client.new(x_api_key: "key", stubs: stubs)
    response = client.create_template({test_mode: true})
    assert_response_body(response)
  end
end


