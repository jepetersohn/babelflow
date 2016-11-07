class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :author, { class_name: "User" }
  validates :commentable, :body, :author, { presence: true }
  has_many :votes, as: :votable
end
