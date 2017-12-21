require 'test_helper'

class FrontRestaurantShowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:one)
    @restaurant = restaurants(:fattys)
    sign_in @user
  end

  test "restaurant show page" do
    get restaurant_path(@restaurant)
    assert_template 'restaurants/show'
    assert_match @restaurant.name, response.body
    assert_match @restaurant.category.name, response.body
    assert_match @restaurant.description, response.body
  end
end
