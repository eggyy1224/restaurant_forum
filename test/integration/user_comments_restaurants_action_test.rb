require 'test_helper'

class UserCommentsRestaurantsActionTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:one)
    @other = users(:two)
    @restaurant = restaurants(:fattys)
    sign_in @user 
  end

  test "user can add new comments to restaurants and display it at restaurant show page" do
    assert_difference 'Comment.count', 1 do
      #url nested的話要先傳前面的物件給path

      post restaurant_comments_path(@restaurant.id), params: {  comment: { content: 'dddd' } }
      
    end
    assert_redirected_to restaurant_path(@restaurant)
    follow_redirect!
    assert_match 'dddd', response.body
    comment = Comment.last
    assert_match comment.user.email, response.body
    assert_match comment.user.name, response.body

  end

  test "only admin can see delete button and delete comment" do
    #non-admin
    sign_in @other
    get restaurant_path(@restaurant)
    assert_select 'a', text: 'delete' , count: 0
    comment = comments(:comment)
    assert_no_difference 'Comment.count' do
      delete restaurant_comment_path(@restaurant, comment)
    end

    assert_redirected_to restaurant_path(@restaurant)
    follow_redirect!
    assert_not flash.empty?

    #admin
    sign_in @user
    get restaurant_path(@restaurant)
    assert_select 'a', text: 'delete' 
    assert_difference 'Comment.count', -1 do
      delete restaurant_comment_path(@restaurant, comment)
    end
    assert_redirected_to restaurant_path(@restaurant)
    follow_redirect!
    assert_not flash.empty?
  end


end
