class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  belongs_to :user

  has_many :comments, as: :commentable

  has_many :votes, as: :votable
end
