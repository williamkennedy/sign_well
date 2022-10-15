# SignWell

## Installation

Add this line to your application's Gemfile:

```bash
bundle add sign_well
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install sign_well

## Usage

Every request returns a `SignWell::Response` object. You can call `body` or `to_object` on this to get either the json body or a Ruby object.


### Setup

You will `Ruby 2.7` or greater. 

You will need an `x_api_key` from SignWell to start. After that, you simply initialize the client.

```
client = SignWell::Client.new(x_api_key: ENV['X_API_KEY'])

```

## [Get Document](https://developers.signwell.com/reference/get_api-v1-document)

```
response = client.document('docment_id')
response.body => Hash of the JSON.body
response.to_object =>  OpenStruct 
```

## [Create Document](https://developers.signwell.com/reference/post_api-v1-documents)

```
response = client.create_document(test_mode: true, files: [{name: 'test', file_url: 'exmpaledoc.com'}], recipients: [{id: 1, email: 'william@test.com'}])
response.body => Hash of the JSON.body
response.to_object =>  OpenStruct 
```

## [Create Document from Template](https://developers.signwell.com/reference/post_api-v1-document-templates-documents)

```
response = client.create_document_from_template(test_mode: true, template_id: 'template_id',  recipients: [{id: 1, email: 'test@test.com', placeholder_name: 'Customer', name: 'Customer'}, {id: 2, email: 'sender@sent.com',name: 'William',  placeholder_name: 'Document Sender'}], template_fields: [{api_id: 'TextField_1', value: 'hello'}, {api_id: 'CheckBox_1', value: true}
])
response.body => Hash of the JSON.body
response.to_object =>  OpenStruct 
```

## [Update and Send Document](https://developers.signwell.com/reference/post_api-v1-documents-id-send)

```
response = client.update_and_send_document(document_id, test_mode: true, embedded_signing: true)
response.body => Hash of the JSON.body
response.to_object =>  OpenStruct 
```

## [Delete Document](https://developers.signwell.com/reference/delete_api-v1-documents-id--1)

```
response = client.delete_document(document_id)
```

## [Completed PDF](https://developers.signwell.com/reference/get_api-v1-documents-id-completed-pdf-1)

```
response = client.completed_pdf(document_id, test_mode: true, url_only: true)
response.body => Hash of the JSON.body
response.to_object =>  OpenStruct 
```


## [Get Template](https://developers.signwell.com/reference/get_api-v1-template)

```
response = client.template(tempate_id)
response.body => Hash of the JSON.body
response.to_object =>  OpenStruct 
```

## [Create Template](https://developers.signwell.com/reference/post_api-v1-template)

```
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

response = client.create_template(body)
response.body => Hash of the JSON.body
response.to_object =>  OpenStruct 
```

## [Delete Template](https://developers.signwell.com/reference/delete_api-v1-document-templates-id--1)

```
client.delete_template(id)
```

## [Get API Application](https://developers.signwell.com/reference/get_api-v1-api-applications-id--1)

```
response = client.api_application(id)
response.body => Hash of the JSON.body
response.to_object =>  OpenStruct 
```

## [Delete API Application](https://developers.signwell.com/reference/delete_api-v1-api-applications-id--1)

```
client.delete_api_application(id)
```

## [List Webhooks](https://developers.signwell.com/reference/get_api-v1-hooks-1)

```
response = client.list_web_hooks
response.body => Hash of the JSON.body
response.to_object =>  OpenStruct 
```

## [Create Webhooks](https://developers.signwell.com/reference/post_api-v1-hooks-1)

```
response = client.create_web_hook(test_mode: true, callback_url: 'https://test.com')
response.body => Hash of the JSON.body
response.to_object =>  OpenStruct 
```

## [Delete Webhook](https://developers.signwell.com/reference/delete_api-v1-hooks-id)

```
client.delete_web_hook(id)
```

## [Get Credentials](https://developers.signwell.com/reference/get_api-v1-me-1)

```
client.me
```


## Other requests

If you can't find the method you're looking, you can call HTTP methods on the `client.connection` which is a Faraday object

  ```
client.connection.get(path)
  ```


## Development

  After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

  To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

  Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sign_well. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/sign_well/blob/main/CODE_OF_CONDUCT.md).

## License

  The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

  Everyone interacting in the SignWell project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/sign_well/blob/main/CODE_OF_CONDUCT.md).
