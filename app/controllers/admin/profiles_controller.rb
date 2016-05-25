class Admin::ProfilesController < AdminController
  skip_before_action :authenticate_user_from_token!
  def index
    @profiles = Profile.all
    render json: @profiles, each_serializer: V1::ProfileSerializer
  end

  def show
    @profile = Profile.find(params[:id])
    render json: @profile, serializer: V1::ProfileSerializer
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      render json: @profile
    else
      return head 422
    end
  end

  def profile_params
    params.require(:profile).permit(:public)
  end
end