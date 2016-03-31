class Question < ActiveRecord::Base
  include Votable
  belongs_to :user

  belongs_to :best_answer, class_name: "Answer", foreign_key: :best_answer_id

  has_many :answers

  has_many :comments, as: :commentable

  has_many :votes, as: :votable

  def self.most_recent
    Question.order(created_at: :desc).limit(10)
  end

end
