class CreateFasts < ActiveRecord::Migration
  def change
    create_table :fasts do |t|
      t.string :where
      t.string :when
      t.integer :price
      t.integer :seats
      t.integer :user_id
      t.string :user_email
      t.text :notes

      t.timestamps
    end
  end
end
