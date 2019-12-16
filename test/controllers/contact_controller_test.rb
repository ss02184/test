require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  include Devise:: Test::IntegrationHelpers
  test "should get contact" do
    get contact_url
    assert_response :success
    assert_template layout: 'application'
  end

  test 'request contact without email' do
    post request_contact_url
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test 'request contact' do
    post request_contact_url, params:
        {name: "Matthew", email: "matthew@me.com",
         telephone: "1234567890", message: "Hello"
        }

    assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
  end

end
