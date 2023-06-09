require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup 
    @user = User.new(name: "Ivan", email: "ivan@mail.ru", password: "123456", password_confirmation: "123456")
  end

  test "should be valid" do 
    assert @user.valid?
  end

  test "Name should be present" do 
    @user.name = ' '
    assert_not @user.valid?
  end 

  test "Email should be present" do 
    @user.email = ' '
    assert_not @user.valid?
  end 

  test "Name should not be too long" do 
    @user.name = 'a' * 51
    assert_not @user.valid?
  end 

  test "Email should not be too long" do 
    @user.email = 'a' * 248 + '@mail.ru'
    assert_not @user.valid?
  end 

  test "Email valid address" do 
    invalid_addreses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addreses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be valid"
    end
  end

  test "Email address should be unique" do 
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "Password should have minimum five length" do 
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid? 
  end

  test "Email address shoud be downcase" do 
    mixed_email = "IvanIvanov@mail.ru"
    @user.email = mixed_email
    @user.save
    assert_equal mixed_email.downcase, @user.reload.email
  end
end
