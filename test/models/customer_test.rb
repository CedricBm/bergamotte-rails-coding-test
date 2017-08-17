require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "has orders" do
    customer = Customer.new
    assert customer.respond_to?(:orders)
  end
end
