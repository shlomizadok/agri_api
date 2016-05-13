class V1::SaleSerializer < ActiveModel::Serializer
  attributes :id, :start_at, :active, :organic, :region_name

  has_one :profile
end
