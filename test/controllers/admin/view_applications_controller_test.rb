require "test_helper"

class Admin::ViewApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_view_applications_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_view_applications_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_view_applications_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_view_applications_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_view_applications_destroy_url
    assert_response :success
  end
end
