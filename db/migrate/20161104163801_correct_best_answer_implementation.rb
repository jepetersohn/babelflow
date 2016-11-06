class CorrectBestAnswerImplementation < ActiveRecord::Migration
  def change
  	remove_column :answers, :best, :boolean
  	add_column :questions, :best_answer_id, :integer
  end
end
