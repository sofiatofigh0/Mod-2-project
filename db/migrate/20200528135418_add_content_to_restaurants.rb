class AddContentToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurant_reviews, :content, :text
  end
end
