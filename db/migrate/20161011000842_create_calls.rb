class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.string :city
      t.string :zip
      t.string :prescription
      t.string :income
      t.date :appt_date
      t.string :appt_time

      t.timestamps null: false
    end
  end
end
