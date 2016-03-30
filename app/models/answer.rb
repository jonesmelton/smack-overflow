class Answer < ActiveRecord::Base
  include Votable

  belongs_to :question
  belongs_to :user

  has_many :comments, as: :commentable

  has_many :votes, as: :votable
end
