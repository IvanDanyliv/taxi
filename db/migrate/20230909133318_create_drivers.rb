class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.datetime :birthday

      t.timestamps
    end
  end
end
