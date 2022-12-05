class AddHourToMissions < ActiveRecord::Migration[7.0]
  def change
    add_column :missions, :hour, :integer
  end
end
