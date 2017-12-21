require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user should be valid" do
    user = User.new(name: '', email: '')
    assert_not user.valid?

    user2 = User.new(name: 'eggyy', email: 'foobar@foo.bar', password: "123456", password_confirmation: "123456")
    
    assert user2.valid?

  end
end
