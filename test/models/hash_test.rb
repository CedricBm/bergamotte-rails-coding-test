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

  test "safe invert" do
    h = MyHash.new({"one"=>1,"two"=>2, "1"=>1, "2"=>2})
    h_safe_inverted = h.safe_invert

    assert h_safe_inverted.key?(1)
    assert h_safe_inverted.key?(2)
    assert !h_safe_inverted.key?("one")

    assert_equal ["one", "1"], h_safe_inverted[1]
  end
end
