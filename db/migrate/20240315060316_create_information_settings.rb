class CreateInformationSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :information_settings do |t|
      t.date :date_information
      t.string :title
      t.string :comment

      t.timestamps
    end
  end
end
