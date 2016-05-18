class V1::ProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :settlement, :about, :region_name, :phone, :region_id, :public
end