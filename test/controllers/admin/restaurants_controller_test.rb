require 'test_helper'

class Admin::RestaurantsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:one)
    @restaurant = restaurants(:fattys)
  end

  test "should add a restaurant with valid parameter by new and create" do
    sign_in @user
    assert_no_difference 'Restaurant.count' do
      post admin_restaurants_path, params: { restaurant: { name: '' } }
      assert_template 'admin/restaurants/new'
      assert_not flash.empty?
    end

    assert_difference 'Restaurant.count', 1 do
      post admin_restaurants_path, params: { restaurant: { name: '123' } }
      assert_redirected_to admin_restaurants_path
      assert_not flash.empty?
    end
  end
  

  test "update params should have name " do
    sign_in @user
    patch admin_restaurant_path(@restaurant), params: { restaurant: { name: '' } }
    assert_template 'admin/restaurants/edit'
    assert_not flash.empty?

    patch admin_restaurant_path(@restaurant), params: { restaurant: { name: '123' } }
    assert_redirected_to admin_restaurant_path(@restaurant)
    assert_not flash.empty?

  end



end
