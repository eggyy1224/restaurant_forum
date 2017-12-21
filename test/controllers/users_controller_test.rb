require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:one)
    @user2 = users(:two)
  end
  test "should redirect edit when user is wrong" do
    sign_in @user
    get edit_user_path(@user2)
    assert_redirected_to user_path(@user)
  end

  test "should redirect update when current_user is not user" do
    sign_in @user 
    name = 'new_name'
    intro = 'hihi123'
    put user_path(@user2), params: { user: { name: name, intro: intro } }
    assert_redirected_to user_path(@user)
    
  end
end
