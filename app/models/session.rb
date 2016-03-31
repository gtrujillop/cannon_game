class Session < ActiveRecord::Base
  belongs_to :package
  belongs_to :subject
  has_many :user_sessions
  has_many :users, through: :user_sessions
  has_many :session_resources

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  scope :by_package, -> (package_id) { where("package_id = ?", "#{package_id}") }
  scope :by_user, -> (user_id) { joins(:user_session).where("user_id = ?", "#{package_id}") }

  def self.find_by_package_and_user(package_id, user_id)
    by_package(package_id).by_user(user_id)
  end

end
