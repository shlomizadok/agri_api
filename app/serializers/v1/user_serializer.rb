class V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :email

  has_one :profile, serializer: V1::ProfileSerializer
end