class Product < ActiveRecord::Base
  include Quantities

  belongs_to :category

  has_many :orders
  has_many :product_items
  has_many :items, through: :product_items

  def self.ordered_within_week(begin_date)
    Order.week_beginning_from(begin_date).includes(product: :product_items).map(&:product).uniq.sort
  end
end
