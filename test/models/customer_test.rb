require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "has orders" do
    customer = Customer.new
    assert customer.respond_to?(:orders)
  end

  test "orders are sorted by status" do
    customer = customers(:david)
    orders = customer.sorted_orders

    assert_equal "confirmed", orders.first.status
    assert_equal "canceled", orders.second.status
  end
end
