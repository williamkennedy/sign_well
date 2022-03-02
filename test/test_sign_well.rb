# frozen_string_literal: true

require "test_helper"

class TestSignWell < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SignWell::VERSION
  end
end
