class User < ActiveRecord::Base
  has_many :questions, { foreign_key: :author_id }
  has_many :answers, through: :questions
  has_many :authored_comments, { class_name: "Comment", foreign_key: :author_id }
  has_many :votes, {foreign_key: :voter_id}

  validates :username, :email, uniqueness: true, presence: true
  validate :validate_password_length


  def validate_password_length
    if @raw_password.nil?
      errors.add(:password, "is required")
    elsif @raw_password.length < 4
      errors.add(:password, "must be at least 4 characters")
    end
  end

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @raw_password = new_password
    password = BCrypt::Password.create(new_password)
    self.hashed_password = password
  end

  def authenticate(email, password)
    self.password == password && self.email == email
  end

end
