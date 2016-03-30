class User < ActiveRecord::Base
  include BCrypt

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :name, :email, {:presence => true}
  validates :email, uniqueness: true
  validates :name, uniqueness: true

  validate :password_check

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @plain_password = new_password
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def password_check
    if @plain_password == ""
      errors.add(:password, "must be present")
    elsif @plain_password.length < 6
      errors.add(:password, "must be 6 or more characters")
    end
  end

  def self.authenticate(args = {})
    current_user = User.find_by(email: args[:email])
    # binding.pry
    if current_user && current_user.password == args[:password]
      current_user
    else
      nil
    end
  end

end
