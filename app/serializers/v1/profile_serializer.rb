class V1::ProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :settlement, :about, :region_name, :phone, :region_id, :public, :full_address

  has_many :sales
end