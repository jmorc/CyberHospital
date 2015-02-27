class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.text :summary
      t.decimal :temperature
      t.integer :heart_rate

      t.timestamps
    end
  end
end
