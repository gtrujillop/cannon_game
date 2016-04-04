class User < ActiveRecord::Base
  has_many :user_packages
  has_many :packages, through: :user_packages
  accepts_nested_attributes_for :packages
  has_many :user_sessions
  has_many :sessions, through: :user_sessions

  validates :password, presence: true, confirmation: true, length: { minimum: 3}
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true, format:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create
  validates :username, presence: true, uniqueness: true, length: { maximum: 10}
  # TODO Check why this validation fails
  # validates :is_admin, presence: true

  # Will only list only non admin users.
  default_scope { where(is_admin: false) }
  scope :by_username, -> (username) { where("username = ?", "#{username}") }
  scope :by_password, -> (password) { where("password = ?", "#{password}") }

  def self.find_by_credentials(username, password)
    by_username(username).by_password(password).first
  end

  def save_packages(packages)
    packages.each do |package|
      package.merge!(user_id: id)
      unless UserPackage.new(package).save
        return false
      end
    end
    true
  end
end
