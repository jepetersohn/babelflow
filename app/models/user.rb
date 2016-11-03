class User < ActiveRecord::Base
  has_many :questions, { foreign_key: :author_id}
  has_many :answers, through: :questions
  has_many :authored_comments, class_name: :comments, {foreign_key: :author_id}
  has_many :votes, {foreign_key: :voter_id}

  validates :username, :email, uniqueness: true, presence: true
  validate :validate_password_length


  # def validate_password_length

  # end
end
