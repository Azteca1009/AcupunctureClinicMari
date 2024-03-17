class CreateCalenderWeekDays < ActiveRecord::Migration[7.1]
  def change
    create_table :calender_week_days do |t|
      t.integer :sunday
      t.integer :monday
      t.integer :tuesday
      t.integer :wednesday
      t.integer :thursday
      t.integer :friday
      t.integer :saturday

      t.timestamps
    end
  end
end
