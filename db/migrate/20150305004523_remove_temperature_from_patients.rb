class RemoveTemperatureFromPatients < ActiveRecord::Migration
  def change
  	remove_column :patients, :temperature
  	remove_column :patients, :heart_rate
  	add_column :patients, :viewable_time, :string
  end
end
