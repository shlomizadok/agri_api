class V1::RegionsController < ApplicationController
  skip_before_action :authenticate_user_from_token!

  def index
    @regions = Region.all
    render json: @regions, each_serializer: V1::RegionSerializer
  end

  def show
    @users = User.in_region(params[:id])
    render json: @users
  end
end