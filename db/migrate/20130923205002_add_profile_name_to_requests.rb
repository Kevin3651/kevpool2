class AddProfileNameToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :profile_name, :string
  end
end
