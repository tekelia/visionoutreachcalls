class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :date
      t.references :calls, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
