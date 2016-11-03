class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |table|
      table.string :title, null:false
      table.string :body, null:false
      table.integer :author_id, null:false
      table.timestamps(null:false)
    end
  end
end
