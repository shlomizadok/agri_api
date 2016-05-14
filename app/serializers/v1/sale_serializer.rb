class V1::SaleSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :active, :organic, :region_name, :vegetables, :hours, :user_id, :start_at, :about

  has_one :profile

  def start_time
    object.start_at.strftime('%d-%m-%Y')
  end
end
