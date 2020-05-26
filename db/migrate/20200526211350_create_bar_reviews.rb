class CreateBarReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :bar_reviews do |t|
      t.integer :bar_id
      t.integer :user_id
      t.integer :safety
      t.boolean :hand_sanitizer, default: false
      t.boolean :masks, default: false
      t.boolean :to_go, default: false
      t.boolean :reduced_seating, default: false

      t.timestamps
    end
  end
end
