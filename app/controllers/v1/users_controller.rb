class V1::UsersController < ApplicationController
  # skip_before_action :authenticate_user_from_token!

  def index

  end

  def show
    @user = User.find(params[:id])
    render json: @user, serializer: V1::UserSerializer, root: nil
  end

  def me
    @user = current_v1_user
    render json: @user, serializer: V1::UserSerializer, root: nil
  end
end