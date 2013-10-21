class CreateQuickRides < ActiveRecord::Migration
  def change
    create_table :quick_rides do |t|
      t.string :when
      t.string :where
      t.integer :price
      t.integer :seats
      t.text :notes

      t.timestamps
    end
  end
end
