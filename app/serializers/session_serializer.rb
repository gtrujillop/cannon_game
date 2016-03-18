class SessionSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date
  attributes :package, :subject

  has_one :package, serializer: PackageSerializer
  has_one :subject, serializer: SubjectSerializer

  def package
    object.package
  end
  private :package

  def subject
    object.subject
  end
  private :subject
end
