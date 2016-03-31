class Comment < ActiveRecord::Base
  include Votable

  belongs_to :commentable, polymorphic: true

  belongs_to :user

  has_many :votes, as: :votable

end
