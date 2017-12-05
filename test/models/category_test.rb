require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'name is required for new category' do
    category = Category.new(name: "")
    assert_not category.valid?
  end
end
