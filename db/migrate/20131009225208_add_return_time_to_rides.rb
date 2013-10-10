class AddReturnTimeToRides < ActiveRecord::Migration
  def change
    add_column :rides, :return_time, :time
  end
end
