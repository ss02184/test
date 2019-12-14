class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews
  has_one_attached :img
  validates_presence_of :title, :description, :author, :user_id

  after_commit :add_default_cover, on: [:create, :update]
  private def add_default_cover
    unless img.attached?
      self.img.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.jpeg")), filename: 'default.jpeg' , content_type: "image/jpg")
    end
  end
end
