class UserSession < ActiveRecord::Base
  belongs_to :user
  belongs_to :session

  validates :grade, presence: true, confirmation: true, numericality: true
  validates :session_date, presence: true
end
