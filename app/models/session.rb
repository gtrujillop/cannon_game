class Session < ActiveRecord::Base
  belongs_to :package
  belongs_to :subject
  has_many :user_sessions
  has_many :users, through: :user_sessions
  has_many :session_resources

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
