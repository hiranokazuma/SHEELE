require "test_helper"

class Admin::ManagementNoticesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_management_notices_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_management_notices_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_management_notices_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_management_notices_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_management_notices_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_management_notices_destroy_url
    assert_response :success
  end

  test "should get confirm" do
    get admin_management_notices_confirm_url
    assert_response :success
  end

  test "should get complete" do
    get admin_management_notices_complete_url
    assert_response :success
  end
end
