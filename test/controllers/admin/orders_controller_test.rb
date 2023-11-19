require "test_helper"

class Adimin::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get adimin_orders_show_url
    assert_response :success
  end

  test "should get update" do
    get adimin_orders_update_url
    assert_response :success
  end
end
