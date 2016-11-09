class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
  	change_column :calls, :appt_date, :string
  end
end
