require 'test_helper'

class IndexPageTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
  end

  test 'index page should have pagination' do
    sign_in @user

    get admin_restaurants_path
    
    assert_select 'nav.pagination', count: 2
    
  end
end
