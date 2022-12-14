require "test_helper"

class Public::ManagementNoticesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_management_notices_show_url
    assert_response :success
  end
end
