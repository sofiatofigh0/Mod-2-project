class AddTitleToRestaurantReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurant_reviews, :title, :string
  end
end
