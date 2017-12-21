require 'test_helper'

class FronCategoryShowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:one)
    sign_in @user 
  end
  #確認每個show頁面只會顯示同一個類別的餐廳
  test "category show page" do
    categories = Category.all 
    categories.each do |category|
      get category_path(category)
      assert_select 'li.active', text: category.name
      restaurants = category.restaurants
      restaurants.each do |restaurant|
        assert_equal category, restaurant.category
      end
    end
    
  end
end
