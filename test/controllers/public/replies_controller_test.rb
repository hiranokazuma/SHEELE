require "test_helper"

class Public::RepliesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_replies_new_url
    assert_response :success
  end

  test "should get create" do
    get public_replies_create_url
    assert_response :success
  end

  test "should get confirm" do
    get public_replies_confirm_url
    assert_response :success
  end

  test "should get complete" do
    get public_replies_complete_url
    assert_response :success
  end
end
