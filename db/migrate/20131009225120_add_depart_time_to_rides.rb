class AddDepartTimeToRides < ActiveRecord::Migration
  def change
    add_column :rides, :depart_time, :time
  end
end
