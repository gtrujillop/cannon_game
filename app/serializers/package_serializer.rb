class PackageSerializer < ActiveModel::Serializer
  attributes :id, :name, :sessions, :session_count

  def sessions
    object.sessions
  end
  private :sessions

  def session_count
    object.sessions.count;
  end
  private :session_count

end
