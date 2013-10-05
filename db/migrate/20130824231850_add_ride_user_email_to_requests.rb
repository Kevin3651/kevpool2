class AddRideUserEmailToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :ride_user_email, :string
  end
end
