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
end
