class Item < ActiveRecord::Base
  include Quantities

  has_many :product_items
  has_many :products, through: :product_items

  def self.ordered_within_week(begin_date)
    Order.week_beginning_from(begin_date).includes(product: [items: :product_items]).map{|order| order.product.items}.flatten.uniq.sort
  end
end
