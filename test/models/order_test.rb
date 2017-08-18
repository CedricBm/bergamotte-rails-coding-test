require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "belongs to a Customer" do
    order = Order.new
    assert order.respond_to?(:customer)
  end

  test "fetches a week of orders" do
    orders = Order.week_beginning_from(1.week.ago)

    included_order = orders(:one)
    excluded_order = orders(:two)

    assert orders.include?(included_order)
    assert orders.exclude?(excluded_order)
  end

  test "default fetch for a week of orders" do
    orders = Order.week_beginning_from(nil)

    included_order = orders(:one)
    excluded_order = orders(:two)

    assert orders.include?(included_order)
    assert orders.exclude?(excluded_order)
  end

  test "displays order uniq customer count by number of orders" do
    analytics = Order.customer_count_by_number_of_orders(1.week.ago)

    assert_equal "2", analytics[1]["customer_count"]
    assert_equal "66.67%", analytics[1]["customer_rate"]
    assert_equal "1", analytics[2]["customer_count"]
    assert_equal "33.33%", analytics[2]["customer_rate"]
  end
end
