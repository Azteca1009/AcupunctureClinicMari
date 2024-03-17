class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :tel
      t.string :email
      t.integer :age
      t.string :comment

      t.timestamps
    end
  end
end
