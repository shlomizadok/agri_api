require 'test_helper'

class ProfileTest < ActiveSupport::TestCase

  setup do
    @user = FactoryGirl.create(:user)
    @region = FactoryGirl.create(:region)
  end

  test 'Profile must have name' do
    profile = Profile.new(user_id: @user.id, region_id: @region.id)
    refute profile.valid?
    profile.name = 'my name'
    assert profile.valid?
  end

  test 'Profile must have a user' do
    profile = Profile.new(region_id: @region.id, name: 'his name')
    refute profile.valid?
    assert_includes(profile.errors.messages.keys, :user)
  end

  test 'Profile must have a region' do
    profile = Profile.new(user_id: @user.id, name: 'his name')
    refute profile.valid?
    assert_includes(profile.errors.messages.keys, :region)
  end
end
