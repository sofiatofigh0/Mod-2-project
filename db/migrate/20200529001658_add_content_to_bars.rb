class AddContentToBars < ActiveRecord::Migration[6.0]
  def change
    add_column :bar_reviews, :content, :text
  end
end
