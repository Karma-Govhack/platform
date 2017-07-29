class InitMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :Volunteer do |t|
      t.string :first_name
      t.string :last_name
      t.decimal :lat
      t.decimal :long
      t.text :note
      t.decimal :hours
      t.string :phone
      t.string :email
    end
  end
end
