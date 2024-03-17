class CreateCalenderHolidays < ActiveRecord::Migration[7.1]
  def change
    create_table :calender_holidays do |t|
      t.date :date_holiday
      t.integer :holiday_flg

      t.timestamps
    end
  end
end
