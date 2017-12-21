require 'test_helper'

class BackstageCrudTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:one)
    @restaurant = restaurants(:fattys)
  end

  test "admin can add restaurants" do
    sign_in @user
     
    assert_difference 'Restaurant.count', 1 do
      post admin_restaurants_path, params: { restaurant: { name: "123" } }
    end
    assert_redirected_to admin_restaurants_path
    follow_redirect!
    assert_not flash.empty?
  end

  test "admin can edit restaurants" do
    sign_in @user

    name = "hihi"
    patch admin_restaurant_path(@restaurant), params: { restaurant: { name: name } }
    assert_equal name, @restaurant.reload.name
    assert_redirected_to admin_restaurant_path(@restaurant)
    follow_redirect!
    assert_not flash.empty?
  end

  test "admin can delete restaurants" do
    sign_in @user 

    assert_difference 'Restaurant.count', -1 do
      delete admin_restaurant_path(@restaurant)
    end

    assert_redirected_to admin_restaurants_path
    follow_redirect!
    assert_not flash.empty?

  end
end
