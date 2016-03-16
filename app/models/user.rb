class User < ActiveRecord::Base
  has_many :user_packages
  has_many :packages, through: :user_packages
  has_many :user_sessions
  has_many :sessions, through: :user_sessions

  validates :password, presence: true, confirmation: true, length: { minimum: 3}
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true, format:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  validates :auth_token, presence: true
end
