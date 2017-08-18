class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :product

  enum status: [:daft, :confirmed, :canceled]

  def self.week_beginning_from(begin_date)
    begin_date = Date.today - 1.week if begin_date.blank?

    Order.where("created_at >= ? AND created_at <= ?", begin_date, begin_date + 1.week)
  end

  def self.customer_count_by_number_of_orders(begin_date)
    count_customers = Customer.count.to_f
    orders = Order.week_beginning_from(begin_date)

    analytics_result = orders.group(:customer_id).count
    analytics_result = MyHash.new(analytics_result).safe_invert
    analytics_result.each{ |key, value| analytics_result[key] = compute_customer_order_details(value.size, count_customers) }

    analytics_result.sort.to_h
  end

  private

    def self.compute_customer_order_details(count, total)
      customer_rate = ((count / total) * 100).round(2)

      detail = {}
      detail["customer_count"] = count.to_s
      detail["customer_rate"] = "#{customer_rate}%"

      detail
    end
end
