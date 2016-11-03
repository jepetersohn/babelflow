class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :voter, { class_name: "User" }
  validates :votable, { presence: true }
end
