require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get home" do
    # get '/'
    get root_path
    assert_response :success
    # assert_select "title", "Home | #{@base_title}"
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    # get static_pages_help_url
    get help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    # get static_pages_about_url
    get about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contacts" do
    # get static_pages_contacts_url
    get contact_url
    # get :contact
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
end
