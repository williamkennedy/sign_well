require 'test_helper'

class DocumentResourceTest < Minitest::Test
  def test_get
    id = "123"
    stubs = stub_get_request("documents/#{id}", response: File.read("test/fixtures/document.json"))
    client = SignWell::Client.new(x_api_key: "key", stubs: stubs)
    response = client.document(id)
    assert_response_body(response)
  end

  def test_create
    body = { test_mode: true }
    stubs = stub_post_request("documents", response: File.read("test/fixtures/documents.json", body: body))
    client = SignWell::Client.new(x_api_key: "key", stubs: stubs)
    response = client.create_document(body)
    assert_response_body(response)
  end

  def test_create_document_from_template
    body = { test_mode: true }
    stubs = stub_post_request("document_templates/documents", response: File.read("test/fixtures/document_template.json", body: body))
    client = SignWell::Client.new(x_api_key: "key", stubs: stubs)
    response = client.create_document_from_template(body)
    assert_response_body(response)
  end
end


