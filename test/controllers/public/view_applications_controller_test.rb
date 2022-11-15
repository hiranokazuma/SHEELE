require "test_helper"

class Public::ViewApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_view_applications_index_url
    assert_response :success
  end

  test "should get create" do
    get public_view_applications_create_url
    assert_response :success
  end

  test "should get edit" do
    get public_view_applications_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_view_applications_update_url
    assert_response :success
  end

  test "should get confirm" do
    get public_view_applications_confirm_url
    assert_response :success
  end

  test "should get complete" do
    get public_view_applications_complete_url
    assert_response :success
  end

  test "should get deatroy" do
    get public_view_applications_deatroy_url
    assert_response :success
  end
end
