require 'test_helper'

class Admin::RestaurantsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:one)
    @restaurant = restaurants(:fattys)
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
