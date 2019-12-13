class Review < ApplicationRecord
  belongs_to :book
  has_one :user
  validates_presence_of :comment, :rating
end
