require 'test_helper'

class ShowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @restaurant = restaurants(:fattys)
    @user = users(:one)
  end

  test "should show conformation about a restaurant" do

    sign_in @user
    get admin_restaurant_path(@restaurant)
    assert_template 'admin/restaurants/show'
    assert_match @restaurant.name, response.body
  end
end
