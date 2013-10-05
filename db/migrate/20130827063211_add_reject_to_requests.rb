class AddRejectToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :reject, :boolean,  :default => false
  end
end
