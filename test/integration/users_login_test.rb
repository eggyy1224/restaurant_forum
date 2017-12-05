require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:one)
    @user2 = users(:two)
  end
  test 'login as normal user' do

    sign_in @user2
    get restaurants_index_path
    assert_template 'restaurants/index'

    get admin_restaurants_path#非管理員進不去後台
    assert_redirected_to root_path

    get admin_categories_path#非管理員進不去後台
    assert_redirected_to root_path
    
    
  end

  test 'login as admin user' do

    sign_in @user
    get restaurants_index_path
    assert_template root_path

    get admin_restaurants_index_path#非管理員進不去後台
    #管理員身份可以進去後臺
    assert_template 'admin/restaurants/index'

    get admin_categories_path#非管理員進不去後台
    #管理員身份可以進去後臺
    assert_template 'admin/categories/index'
    
    
  end
end
