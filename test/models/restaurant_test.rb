require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test "Restaurant model validates name" do
    
    
    restaurant = Restaurant.new(name: "")
    assert_not restaurant.valid?
    restaurant = Restaurant.new(name: "123")
    assert restaurant.valid?
  end
end
