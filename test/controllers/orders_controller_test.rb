require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "must login before viewing orders" do
    get :index
    assert_redirected_to customer_login_path
  end

  test "shows orders when logged" do
    customer = customers(:david)
    session[:customer_login] = customer.login
    session[:password] = customer.password

    get :index
    assert_response :success
  end
end
