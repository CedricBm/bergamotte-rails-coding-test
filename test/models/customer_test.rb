require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "a customer has orders" do
    customer = Customer.new
    assert customer.respond_to?(:orders)
  end
end
