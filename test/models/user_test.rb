require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:one)

  end

  test '#books' do
    assert_equal 2, @user.books.size
  end

  test "user should save" do
    user = User.new(email: "emails@email.com", encrypted_password: "emailaddress", password: 'MMMMMMMMan')
    assert user.save
  end

end
