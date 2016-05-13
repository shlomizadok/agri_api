class Profile < ApplicationRecord
  acts_as_tagger
  acts_as_taggable_on :vegs
  belongs_to :user
  has_many :sales, through: :user
  belongs_to :region

  def region_name
    region.name
  end
end
