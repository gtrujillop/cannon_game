class Package < ActiveRecord::Base
  has_many :sessions
  accepts_nested_attributes_for :sessions
  has_many :user_packages
  has_many :users, through: :user_packages

end
