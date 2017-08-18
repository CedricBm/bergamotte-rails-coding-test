require 'test_helper'

class CustomersLoginControllerTest < ActionController::TestCase
  test "shows index" do
    get :index
    assert_response :success
  end
end
