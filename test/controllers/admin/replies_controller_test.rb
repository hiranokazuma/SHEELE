require "test_helper"

class Admin::RepliesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_replies_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_replies_create_url
    assert_response :success
  end

  test "should get confirm" do
    get admin_replies_confirm_url
    assert_response :success
  end

  test "should get complete" do
    get admin_replies_complete_url
    assert_response :success
  end
end
