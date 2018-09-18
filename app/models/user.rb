# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string
#  phone           :string
#  password_digest :string           not null
#  fname           :string           not null
#  lname           :string           not null
#  session_token   :string           not null
#  dob             :date             not null
#  admin           :boolean          default(FALSE), not null
#  gender          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord

  validates :password_digest, :fname, :lname, :session_token,
   :dob, :email, presence: true

  validates :email, :phone, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :phone, length: {is: 10, allow_nil: true}
  before_validation :ensure_session_token

  has_many :posts, inverse_of: :user

  has_many :photos, inverse_of: :user

  has_many :comments, inverse_of: :user

  has_many :likes, inverse_of: :user

  def self.find_by_credentials(username, pw)
    user = User.find_by(username: username)
    if user
      return user if user.is_password?(pw)
    end
    nil
  end

  def self.token
    SecureRandom.urlsafe_base64
  end

  attr_reader :password

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def is_password?(pw)
    BCrypt::Password.new(password_digest).is_password?(pw)
  end

  def ensure_session_token
    self.session_token ||= User.token
  end

  def reset_session_token!
    self.session_token = User.token
    self.save
  end

end
