class UserPackage < ActiveRecord::Base
  belongs_to :user
  belongs_to :package

  scope :by_user, -> (user_id) { where("user_id = ?", "#{user_id}") }
end
