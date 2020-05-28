class AddTitleToBarReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :bar_reviews, :title, :string
  end
end
