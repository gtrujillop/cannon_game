class UserSessionToken < ActiveRecord::Base
  belongs_to :user_session

  validates :name, presence: true, confirmation: true
end
