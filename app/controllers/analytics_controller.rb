class AnalyticsController < ApplicationController
  def index
    @begin_date = Date.new(params["analytics"]["date(1i)"].to_i,
                            params["analytics"]["date(2i)"].to_i,
                            params["analytics"]["date(3i)"].to_i) if params["analytics"].present?

    @products = Product.ordered_within_week(@begin_date)
    @items = Item.ordered_within_week(@begin_date)
    @customers_orders = Order.customer_count_by_number_of_orders(@begin_date)

    respond_to :html, :js
  end

  def recurring_customers
    @recurring_customers = Customer.recurring_customers_by_month
  end
end
