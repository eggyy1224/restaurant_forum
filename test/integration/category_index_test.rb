require 'test_helper'

class CategoryIndexTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
  end

  test 'index page should show category name in response body' do
    sign_in @user

    get admin_categories_path
    
    categories = Category.all
    categories.each do |category|
      assert_match category.name, response.body
    end
    

    
    
    
  end
end
