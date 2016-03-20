class Package < ActiveRecord::Base
  has_many :sessions
  has_many :user_packages
  has_many :users, through: :user_packages

end
