require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "has products" do
    category = Category.new
    assert category.respond_to?(:products)
  end
end
