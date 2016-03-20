class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :email, :username, :package_count

  #has_many :packages

  def package_count
    object.packages.count
  end
  private :package_count
end
