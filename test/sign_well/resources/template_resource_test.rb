require 'test_helper'

class DocumentResourceTest < Minitest::Test
  def test_get_template
    id = "123"
    stubs = stub_get_request("document_templates/#{id}", response: File.read("test/fixtures/template.json"))
    client = SignWell::Client.new(x_api_key: "key", stubs: stubs)
    response = client.template(id)
    assert_response_body(response)
  end

  def test_create_template
    body = {test_mode: true, "files"=>[{"name"=>"string.pdf", "file_url"=>"https://file-examples-com.github.io/uploads/2017/10/file-sample_150kB.pdf"}],
            "placeholders"=>[{"id"=>"string", "name"=>"string"}],
            "draft"=>false,
            "reminders"=>true,
            "apply_signing_order"=>false,
            "text_tags"=>false,
            "allow_decline"=>true,
            "fields"=>[[{"required"=>true, "fixed_width"=>false, "lock_sign_date"=>false, "date_format"=>"MM/DD/YYYY", "x"=>0, "y"=>0, "page"=>0, "placeholder_id"=>"string", "type"=>"date", "api_id"=>"string"}]],
            "attachment_requests"=>[{"required"=>true, "name"=>"string", "placeholder_id"=>"string"}],
            "name"=>"string",
            "subject"=>"string",
            "message"=>"string",
            "expires_in"=>0}
    stubs = stub_template_post_request("document_templates", response: File.read("test/fixtures/create_template.json"), body: body.to_json)
    client = SignWell::Client.new(x_api_key: "key", stubs: stubs)
    response = client.create_template(body)
    assert_response_body(response)
  end

  def test_delete_template
    id = "123"
    stubs = stub_delete_request("document_templates/#{id}")
    client = SignWell::Client.new(x_api_key: "key", stubs: stubs)
    response = client.delete_template(id)
    assert_equal 204, response.to_object.status
  end

  private

  def stub_template_post_request(path, response:, body: {})
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post("/api/v1/#{path}", body) do |env|
        [201, {'Content-Type': "application/json"}, response]
      end
    end
  end
end


