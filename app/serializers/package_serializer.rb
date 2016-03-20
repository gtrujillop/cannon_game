class PackageSerializer < ActiveModel::Serializer
  attributes :id, :name, :session_count

  def session_count
    object.sessions.count;
  end
  private :session_count

end
