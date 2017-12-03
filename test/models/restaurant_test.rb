require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test "Restaurant model validates name" do
    
    assert_no_difference 'Restaurant.count' do
      restaurant = Restaurant.new(name: "")
      restaurant.save
    end

    assert_difference 'Restaurant.count', 1 do
      restaurant = Restaurant.new(name: "123")
      restaurant.save
    end
  end
end
