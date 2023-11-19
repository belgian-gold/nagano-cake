require "test_helper"

class Adimin::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adimin_genres_index_url
    assert_response :success
  end

  test "should get create" do
    get adimin_genres_create_url
    assert_response :success
  end

  test "should get edit" do
    get adimin_genres_edit_url
    assert_response :success
  end

  test "should get update" do
    get adimin_genres_update_url
    assert_response :success
  end
end
