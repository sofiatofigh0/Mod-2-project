class CreateBars < ActiveRecord::Migration[6.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :address
      t.integer :phone_number

      t.timestamps
    end
  end
end
