class User < ActiveRecord::Base
  include BCrypt

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :name, :email, {:presence => true}

  validate :password_check

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @plain_password = new_password
    @password = Password.create(hashed_password)
    self.hashed_password = @password
  end

  def password_check
    if @plain_password == ""
      errors.add(:password, "must be present")
    elsif @plain_password.length < 6
      errors.add(:password, "must be 6 or more characters")
    end
  end

end
