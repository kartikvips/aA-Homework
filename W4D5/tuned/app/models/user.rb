# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord

  validates :email, :session_token, :password_digest, presence: true, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

  attr_reader :password
  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom.base64(16)
  end

  def self.find_by_credentials(email, password)
    return nil unless user = User.find_by(email: email)
    user.is_password?(password) ? user : nil
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    self.save
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

end

#
#
# Write methods to deal with the session token: User::generate_session_token, User#reset_session_token! and User#ensure_session_token.
# Write a User#password=(password) method which actually sets the password_digest attribute using BCrypt, and a User#is_password?(password) method to check the users' password when they log in.
# Be careful setting instance variables in ActiveRecord, you can't just set @password_digest. In #password= use self.password_digest=. (self.___= calls a setter method defined for us by ActiveRecord, which is the state that is saved by self.save. While @___ makes a new instance variable, unrelated to self.save)
# Remember that in the User model, you'll want to use an after_initialize callback to set the session_token before validation if it's not present.
# Write a User::find_by_credentials(email, password) method.
