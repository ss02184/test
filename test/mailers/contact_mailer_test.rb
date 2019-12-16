require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "should return contact email" do
    mail = ContactMailer.contact_email("matthew@me.com", "Matthew Casey", "1234567890", @message = "Hello")
    assert_equal ['contact@example.com'], mail.from
    assert_equal ['contact@example.com'], mail.to
  end

  test "email validation should trigger" do
    assert_not User.new(email: "emailaddress", encrypted_password: "emailaddress").save
  end

  test "missing email field" do
    assert_not User.new(encrypted_password: "emailaddress").save
  end

  test "password too short" do
    assert_not User.new(email: "emails@email.com", encrypted_password: "email").save
  end

  test "missing password field" do
    assert_not User.new(email: "emails@email.com").save
  end

  test "missing both fields" do
    assert_not User.new().save
  end
end
