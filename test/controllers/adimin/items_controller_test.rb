require "test_helper"

class Adimin::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adimin_items_index_url
    assert_response :success
  end

  test "should get new" do
    get adimin_items_new_url
    assert_response :success
  end

  test "should get create" do
    get adimin_items_create_url
    assert_response :success
  end

  test "should get show" do
    get adimin_items_show_url
    assert_response :success
  end

  test "should get edit" do
    get adimin_items_edit_url
    assert_response :success
  end

  test "should get update" do
    get adimin_items_update_url
    assert_response :success
  end
end
