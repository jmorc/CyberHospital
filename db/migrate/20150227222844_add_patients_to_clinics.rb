class AddPatientsToClinics < ActiveRecord::Migration
  def change
  	add_column :patients, :clinic_id, :integer
  	add_index :patients, :clinic_id
  end
end
