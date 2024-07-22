require "test_helper"

class RailsControllerTest < ActionDispatch::IntegrationTest
  test "should get generate" do
    get rails_generate_url
    assert_response :success
  end

  test "should get devise:controllers" do
    get rails_devise:controllers_url
    assert_response :success
  end

  test "should get users" do
    get rails_users_url
    assert_response :success
  end
end
