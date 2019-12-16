require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @review = reviews(:one)
    @book = books(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get new" do
    get ("/books/"+@book.id.to_s+"/reviews/new")
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post ("/books/"+@book.id.to_s+"/reviews/"), params:{review: { rating: @review.rating, comment: @review.comment, name: @review.name }}
    end
    assert_redirected_to ("/books/"+@book.id.to_s)
  end

  test "should get edit" do
    get ("/books/"+@book.id.to_s+"/reviews/"+@review.id.to_s+"/edit")
    assert_response :success
  end

  test "should update review" do
    patch ("/books/"+@book.id.to_s+"/reviews/"+@review.id.to_s), params: { review: { rating: @review.rating, comment: @review.comment}}
    assert_redirected_to root_path
  end

  test "should destroy book" do
    assert_difference('Review.count', -1) do
      delete ("/books/"+@book.id.to_s+"/reviews/"+@review.id.to_s)
    end

    assert_redirected_to (root_path)
  end
end
