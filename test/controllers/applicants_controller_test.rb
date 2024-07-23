require "test_helper"

class ApplicantsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get applicants_new_url
    assert_response :success
  end

  test "should get create" do
    get applicants_create_url
    assert_response :success
  end

  test "should get edit" do
    get applicants_edit_url
    assert_response :success
  end

  test "should get update" do
    get applicants_update_url
    assert_response :success
  end
end
