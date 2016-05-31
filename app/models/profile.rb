class Profile < ApplicationRecord
  belongs_to :user
  has_many :sales, through: :user
  belongs_to :region

  geocoded_by :full_address
  after_validation :geocode


  scope :published, -> {includes(:user, :sales).where(public: true)}

  def region_name
    region.name
  end


  def full_address
    "#{address}, #{settlement}, ישראל"
  end
end
