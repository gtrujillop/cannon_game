class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :email, :username, :package_count, :packages

  has_many :packages

  def packages
    object.packages
  end
  private :packages

  def package_count
    object.packages.count
  end
  private :package_count
end
