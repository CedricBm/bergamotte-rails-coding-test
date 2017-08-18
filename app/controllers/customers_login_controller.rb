class CustomersLoginController < ApplicationController
  def index
  end

  def create
    session[:customer_login] = params[:login]
    session[:customer_password] = params[:password]

    redirect_to orders_path
  end
end
