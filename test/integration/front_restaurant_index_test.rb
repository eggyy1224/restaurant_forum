require 'test_helper'

class FrontRestaurantIndexTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:one)
  end

  test "index page should show restaurants, categories and pagination" do
    sign_in @user
    get root_path
    categories = Category.all

    categories.each do |category|
      assert_select 'a[href=?]', category_path(category)
    end
    
    assert_select 'ul.pagination'
    first_page_restaurants = Restaurant.page(1).per(9)
    first_page_restaurants.each do |restaurant|
      assert_select 'a[href=?]', restaurant_path(restaurant), text: restaurant.name
      assert_select 'p', text: restaurant.category.name

    end
  end


end
