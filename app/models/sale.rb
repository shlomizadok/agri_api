class Sale < ApplicationRecord
  acts_as_taggable_on :vegs
  belongs_to :user
  has_one :profile, through: :user

  validates :start_at, presence: true

  scope :active, -> { includes(:profile).where(active: true, 'profiles.public': true) }
  scope :active_and_now, -> { active.where('start_at <= ?', Time.now) }
  scope :active_and_future, -> { active.where('start_at > ?', Time.now) }

  def public
    profile.public
  end

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
