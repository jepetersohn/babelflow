class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |table|
      table.string :username, null:false
      table.string :email, null:false
      table.string :hashed_password, null:false
      table.timestamps(null:false)
    end
  end
end
