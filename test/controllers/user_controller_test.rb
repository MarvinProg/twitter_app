require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    # get user_new_url
    get singup_path
    assert_response :success
  end
end
 