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

  test "recurring and new customers by month" do
    recurring_analytics = Customer.recurring_customers_by_month

    assert_equal "0", recurring_analytics["June 2016"]["recurring"]
    assert_equal "2", recurring_analytics["June 2016"]["new"]
    assert_equal "2", recurring_analytics["June 2016"]["total"]
    assert_equal "1", recurring_analytics["July 2016"]["recurring"]
    assert_equal "1", recurring_analytics["July 2016"]["new"]
    assert_equal "2", recurring_analytics["July 2016"]["total"]
  end
end
