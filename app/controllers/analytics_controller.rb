class AnalyticsController < ApplicationController
  def index
    @begin_date = Date.new(params["analytics"]["date(1i)"].to_i,
                            params["analytics"]["date(2i)"].to_i,
                            params["analytics"]["date(3i)"].to_i) if params["analytics"].present?

    @products = Product.ordered_within_week(@begin_date)
    @items = Item.ordered_within_week(@begin_date)

    respond_to :html, :js
  end
end
