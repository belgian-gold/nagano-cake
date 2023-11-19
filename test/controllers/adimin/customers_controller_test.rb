require "test_helper"

class Adimin::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adimin_customers_index_url
    assert_response :success
  end

  test "should get show" do
    get adimin_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get adimin_customers_edit_url
    assert_response :success
  end

  test "should get update" do
    get adimin_customers_update_url
    assert_response :success
  end
end
