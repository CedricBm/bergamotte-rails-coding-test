require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "belongs to a category" do
    product = Product.new
    assert product.respond_to?(:category)
  end
end
