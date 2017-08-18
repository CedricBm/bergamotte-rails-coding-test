require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "belongs to a category" do
    product = Product.new
    assert product.respond_to?(:category)
  end

  test "sums the amount of item ordered" do
    marble = products(:marble)

    assert_equal 5, marble.items_amount
  end

  test "product has been ordered within the week timeframe" do
    products = Product.ordered_within_week(1.week.ago)

    marble = products(:marble)
    quartz = products(:quartz)

    assert products.include?(marble)
    assert products.exclude?(quartz)
  end

  test "product has been ordered within the last week" do
    products = Product.ordered_within_week(nil)

    marble = products(:marble)
    quartz = products(:quartz)

    assert products.include?(marble)
    assert products.exclude?(quartz)
  end
end
