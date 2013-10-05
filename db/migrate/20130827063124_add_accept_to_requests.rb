class AddAcceptToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :accept, :boolean,  :default => false
  end
end
