class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :voter, { class_name: "User" }
  validates :votable, { presence: true }
  validates :vote, { numericality: { less_than_or_equal_to: 1,
  																	greater_than_or_equal_to: -1 }}
end
