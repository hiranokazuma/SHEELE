require "test_helper"

class Public::PropertiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_properties_index_url
    assert_response :success
  end

  test "should get show" do
    get public_properties_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_properties_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_properties_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_properties_destroy_url
    assert_response :success
  end

  test "should get new" do
    get public_properties_new_url
    assert_response :success
  end

  test "should get confirm" do
    get public_properties_confirm_url
    assert_response :success
  end

  test "should get complete" do
    get public_properties_complete_url
    assert_response :success
  end
end
