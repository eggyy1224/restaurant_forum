require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:one)
  end

  test "should redirect root when not log in" do
    get root_path
    assert_redirected_to new_user_session_path
  end

  test "log in user can visit front restaurants index" do
    sign_in @user
    get root_path
    assert_template 'restaurants/index'
  end

end
