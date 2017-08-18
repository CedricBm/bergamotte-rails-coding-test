module Quantities
  extend ActiveSupport::Concern

  def items_amount
    if product_items.present?
      product_items.map(&:quantity).inject(&:+)
    else
      0
    end
  end
end