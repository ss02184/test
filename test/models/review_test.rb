require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  
  test "missing rating" do
    review = Review.new(comment: "Excellent Book!")
    assert_not review.save
  end

  test "missing comment" do
    review = Review.new(rating: 5)
    assert_not review.save
  end

end
