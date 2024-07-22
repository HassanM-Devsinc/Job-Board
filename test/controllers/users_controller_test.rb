require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get users_index_url
    assert_response :success
  end
end
