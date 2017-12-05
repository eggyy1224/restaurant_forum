require 'test_helper'

class IndexPageTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
  end

  test 'index page should have pagination and name should show in response body' do
    sign_in @user

    get admin_restaurants_path
    
    assert_select 'ul.pagination', count: 1

    firts_page_restaurants = Restaurant.page(1).per(10)
    
    firts_page_restaurants.each do |restaurant|
      
      assert_match restaurant.name, response.body
    end
    
  end
end
