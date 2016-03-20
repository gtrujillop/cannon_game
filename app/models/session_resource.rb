class SessionResource < ActiveRecord::Base
  belongs_to :session

  validates :name, presence: true
  validates :url, presence: true
end
