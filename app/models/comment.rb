class Comment < ActiveRecord::Base
  include Votable

  belongs_to :commentable, polymorphic: true

  belongs_to :user


  has_many :votes, as: :votable

  def self.most_popular
    Comment.all.sort { |a,b| b.score <=> a.score}
  end
end
