require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "sums the amount of item ordered" do
    paper = items(:paper)
    leather = items(:leather)

    assert_equal 5, paper.items_amount
    assert_equal 0, leather.items_amount
  end

  test "items has been ordered within the week timeframe" do
    items = Item.ordered_within_week(1.week.ago)

    paper = items(:paper)
    leather = items(:leather)

    assert items.include?(paper)
    assert items.exclude?(leather)
  end

  test "items has been ordered within the last week" do
    items = Item.ordered_within_week(nil)

    paper = items(:paper)
    leather = items(:leather)

    assert items.include?(paper)
    assert items.exclude?(leather)
  end
end
