class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = @customer.sorted_orders
  end

  private

    def authenticate_user!
      @customer = Customer.find_by(login: session[:customer_login])

      if @customer.blank? || @customer.password != session[:customer_password]
        session[:customer_login] = nil
        session[:customer_password] = nil

        redirect_to customer_login_path
      end
    end
end
