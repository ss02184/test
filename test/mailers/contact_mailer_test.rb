require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "should return contact email" do
    mail = ContactMailer.contact_email("matthew@me.com", "Matthew Casey", "1234567890", @message = "Hello")
    assert_equal ['contact@example.com'], mail.from
    assert_equal ['contact@example.com'], mail.to
    end
end
