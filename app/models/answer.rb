class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :responder, { class_name: "User" }
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :question, :responder, :body, { presence: true }
  validate :only_one_best_answer_per_question

  def only_one_best_answer_per_question
  	best = 0
  	answer.question.answers.each { | a | best += 1 if a.best }
  	errors.add(:best, "only one best answer allowed per question") if best > 1
  end
end
