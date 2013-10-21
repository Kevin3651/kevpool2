class CreateRequest2s < ActiveRecord::Migration
  def change
    create_table :request2s do |t|
      t.integer :fast_id
      t.text :notes
      t.string :phone
      t.boolean :accept
      t.string :user_email
      t.string :fast_user_email
      t.integer :user_id

      t.timestamps
    end
  end
end
