require "test_helper"

class SWGOH::APITest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SWGOH::API::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
