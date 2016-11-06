class Question < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_one :best_answer, class_name: "Answer", foreign_key: :best_answer_id

  validates :title, :body, {presence: true}
end
