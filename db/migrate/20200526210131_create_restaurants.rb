class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.float :yelp_rating
      t.string :price_range
      t.string :img_url

      t.timestamps
    end
  end
end
