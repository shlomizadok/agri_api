class Profile < ApplicationRecord
  belongs_to :user
  has_many :sales, through: :user
  belongs_to :region

  def region_name
    region.name
  end
end
