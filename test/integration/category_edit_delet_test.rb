require 'test_helper'

class EditDeletTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
  end
  test 'should update with valid value' do 
    @category = categories(:thai)
    sign_in @user
    @rename = "123"
    patch admin_category_path(@category), params: { category: { name: @rename } }
    assert_redirected_to admin_categories_url
    follow_redirect!
    assert_match @rename, response.body
  end

  test 'should delete category after destroy action' do
    sign_in @user
    @category = categories(:thai)

    assert_difference 'Category.count', -1 do
      delete admin_category_path(@category)
    end
    assert_redirected_to admin_categories_url
  end
end
