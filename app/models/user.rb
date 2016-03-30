class User < ActiveRecord::Base
  include BCrypt

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(hashed_password)
    self.hashed_password = @password
  end

end
