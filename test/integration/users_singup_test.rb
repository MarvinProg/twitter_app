require "test_helper"

class UsersSingupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "invalid sing_up registration" do 
    # get singup_path
    get new_user_path

    assert_no_difference "User.count" do 
      # post users_path, user: {
      post users_path, params: { 
        user: {
          name: "", 
          email: "ingdd@", 
          password: "ddd", 
          password_confirmation: "fff"
        }
      }
    end

    # assert_template new_user_path
    assert_template "users/new"
  end

  test "valid singup informstion" do 
    # get singup_path
    get new_user_path

    assert_difference "User.count", 1 do 
      # post users_path, user: {
      post users_path, params: { 
        user: {
          name: "Example User", 
          email: "user@example.com", 
          password: "password", 
          password_confirmation: "password"
        }
      }
      
      follow_redirect!
    end

    # assert_template new_user_path
    assert_template "users/show"
  end
end
