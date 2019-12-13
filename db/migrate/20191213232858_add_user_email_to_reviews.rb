class AddUserEmailToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :user_email, :string
  end
end
