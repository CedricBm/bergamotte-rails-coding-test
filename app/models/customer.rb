class Customer < ActiveRecord::Base
  has_many :orders

  def sorted_orders
    orders.order(:status)
  end

  def self.recurring_customers_by_month
    recurring_analytics = {}
    old_customer_ids = []
    customers_orders = Order.order(created_at: :asc).pluck(:customer_id, :created_at)

    while customers_orders.any? do
      customers_to_compute, customers_orders = customers_for_the_first_month(customers_orders)

      recurring_customers, new_customers, old_customer_ids = compute_customers(customers_to_compute, old_customer_ids)

      key = customers_to_compute.first.second.strftime('%B %Y')
      recurring_analytics[key] = format_results(recurring_customers, new_customers)
    end

    recurring_analytics
  end

  private

    def self.customers_for_the_first_month(customers_orders)
      current_month = customers_orders.first.second.month
      current_year = customers_orders.first.second.year

      customers_orders.partition{|co| co.second.month == current_month && co.second.year == current_year}
    end

    def self.compute_customers(customers_to_compute, old_customer_ids)
      recurring_customers = 0
      new_customers = 0
      current_customer_ids = []

      customers_to_compute.each do |customer|
        # ignoring the same customer ordering multiple times in a month
        if current_customer_ids.exclude?(customer.first)
          current_customer_ids << customer.first

          if old_customer_ids.include?(customer.first)
            recurring_customers = recurring_customers + 1
          elsif
            new_customers = new_customers + 1
            old_customer_ids << customer.first
          end
        end
      end

      [recurring_customers, new_customers, old_customer_ids]
    end

    def self.format_results(recurring_customers, new_customers)
      result = {}
      result["recurring"] = recurring_customers.to_s
      result["new"] = new_customers.to_s
      result["total"] = (recurring_customers + new_customers).to_s

      result
    end
end
