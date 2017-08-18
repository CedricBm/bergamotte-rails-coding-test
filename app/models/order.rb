class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product

  enum status: [:daft, :confirmed, :canceled]

  def self.week_beginning_from(begin_date)
    begin_date = Date.today - 1.week if begin_date.blank?

    Order.where("created_at >= ? AND created_at <= ?", begin_date, begin_date + 1.week)
  end
end
