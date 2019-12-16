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

  test "missing password" do
    user = User.new(email: "emails@gmail.com")
    assert_not user.save
  end

  test "missing email" do
    user = User.new(encrypted_password: "emailaddress", password: 'MMMMMMMMan')
    assert_not user.save
  end

  test 'recent' do
    assert_includes User.recent, users(:one)
    refute_includes User.recent, users(:two)
  end

end
