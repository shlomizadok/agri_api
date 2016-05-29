class V1::RegionSerializer < ActiveModel::Serializer
  cache key: 'region'
  attributes :id, :name
end