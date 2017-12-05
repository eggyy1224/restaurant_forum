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

  test "should add categories to index" do
    sign_in @user
    assert_difference 'Category.count', 1 do
      post admin_categories_path(params: { category: { name: "japnanese" } })
    end
    assert_redirected_to admin_categories_path
    assert_not flash.empty?
  end

  test "should not add categories to index with a empty name" do
    sign_in @user
    assert_no_difference 'Category.count', 1 do
      post admin_categories_path(params: { category: { name: "" } })
    end
    assert_template 'admin/categories/index'
    assert_not flash.empty?
  end


end
