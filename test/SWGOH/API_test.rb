# frozen_string_literal: true

require 'test_helper'
require 'minitest/autorun'

class APITest < Minitest::Test
  def test_it_has_a_version_number
    refute_nil SWGOH::API::VERSION
  end
end
