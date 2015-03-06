class CreatePatientData < ActiveRecord::Migration
  def change
    create_table :patient_data do |t|
      t.string :name
      t.string :value
      t.text :comment
      t.integer :patient_id
    end

    add_index :patient_data, :patient_id
  end
end
