class User < ActiveRecord::Base
  # Remember to create a migration!

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

end
