class V1::SalesController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:index, :show]

  def index
    @sales = Sale.includes(:profile, :user).all
    render json: @sales, each_serializer: V1::SaleSerializer
  end

  def show
    @sale = Sale.find(params[:id])
    render json: @sale, serializer: V1::SaleSerializer, root: nil
  end
end