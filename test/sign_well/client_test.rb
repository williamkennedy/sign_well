require 'test_helper'

class ClientTest < MiniTest::Test
  def test_initialize
    client = SignWell::Client.new(x_api_key: 'x_api_key')
    assert_equal SignWell::Client, client.class
  end
end
