class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :validatable

  has_many :sales
  has_one :profile

  after_create :update_access_token!

  def self.from_facebook(auth)
    if user = find_by_email(auth['email'])
      user
    else
      user = new(email: auth['email'], password: Devise.friendly_token[0, 20])
      user.save!
      user
    end
  end

  private

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
  end
end
