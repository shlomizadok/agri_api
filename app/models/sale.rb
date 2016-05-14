class Sale < ApplicationRecord
  acts_as_taggable_on :vegs
  belongs_to :user
  has_one :profile, through: :user

  def region
    profile.region
  end

  def region_name
    region.name
  end

  def vegetables
    veg_list.to_s
  end
end
