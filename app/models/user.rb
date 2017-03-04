# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string
#  email         :string
#  password_hash :string
#  password_salt :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password
  has_many :posts
  EMAIL_REXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i


  validates :name, presence: true
  validates :email, presence: true, format: { with: EMAIL_REXP, message: "is not a valid email address" }
  validates :password, presence: true
  validates :password, confirmation: true

  def self.search(query)
    where("name like ? OR email like ?", "%#{query}%", "%#{query}%")
  end

  def self.authentication(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      return user
    else
      return nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
