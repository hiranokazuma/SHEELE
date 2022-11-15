require "test_helper"

class Admin::MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_messages_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_messages_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_messages_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_messages_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_messages_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_messages_destroy_url
    assert_response :success
  end
end
