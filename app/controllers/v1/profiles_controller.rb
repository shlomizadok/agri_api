class V1::ProfilesController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:index]
  def index
    @profiles = Profile.all
    render json: @profiles, each_serializer: V1::ProfileSerializer
  end

  def create
    @profile = Profile.new(profile_params)
    profile.public = false
    @profile.user_id = current_v1_user.id
    if @profile.save
      render json: @profile
    else
      return head 422
    end
  end

  def update
    @profile = Profile.find(params[:id])
    return head 401 unless @profile.user_id == current_v1_user.id
    if @profile.update(profile_params)
      render json: @profile
    else
      return head 422
    end
  end

  def profile_params
    params.require(:profile).permit(:name, :address, :settlement, :region_id, :about, :phone)
  end
end