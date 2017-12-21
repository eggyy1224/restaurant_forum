require 'test_helper'

class UserShowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:one)
    sign_in @user
  end

  test "show page" do
    get user_path(@user)
    assert_template 'users/show'
    assert_match @user.name, response.body
    assert_match @user.email, response.body
    assert_select "img"
    assert_select 'a[href=?]', edit_user_path(@user)
    restaurants = @user.restaurants.uniq
    restaurants.each do |restaurant|
      assert_match restaurant.name, response.body
    end 
  end



  test "edit user profile" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = 'new_name'
    intro = 'hihi123'
    put user_path(@user), params: { user: { name: name, intro: intro } }
    assert_redirected_to user_path(@user)
    follow_redirect!
    assert_not flash.empty?
    assert_match name, response.body
    assert_match intro, response.body
    
  end
end
