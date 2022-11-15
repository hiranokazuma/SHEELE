require "test_helper"

class Admin::PropertiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_properties_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_properties_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_properties_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_properties_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_properties_destroy_url
    assert_response :success
  end
end
