require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test "Restaurant model" do
    assert Restaurant.new(name: "123")
  end
end
