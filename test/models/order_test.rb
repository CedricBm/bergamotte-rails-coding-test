require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "belongs to a Customer" do
    order = Order.new
    assert order.respond_to?(:customer)
  end
end
