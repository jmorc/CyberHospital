class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name,   null: false
      t.string  :value,   null: false
      t.text    :comment
      t.integer :patient_id,   null: false
    end

    drop_table :patient_data
    add_index :items, :patient_id
  end
end
