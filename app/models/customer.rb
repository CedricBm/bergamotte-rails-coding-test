class Customer < ActiveRecord::Base
  has_many :orders

  def sorted_orders
    orders.order(:status)
  end
end
