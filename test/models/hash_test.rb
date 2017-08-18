require 'test_helper'

class HashTest < ActiveSupport::TestCase
  test "#dig personal implementation" do
    h = MyHash.new({ foo: {bar: {baz: 1}}})

    assert_equal 1, h.dig(:foo, :bar, :baz)
    assert_nil h.dig(:foo, :zot)
    assert_raise ArgumentError do
      h.dig
    end
  end
end
