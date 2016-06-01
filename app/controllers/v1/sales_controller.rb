class V1::SalesController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: [:index, :show]

  def index
    @sales = params[:future] ? Sale.includes(:profile, :user).active_and_future : Sale.includes(:profile, :user).active_and_now
    render json: @sales, each_serializer: V1::SaleSerializer
  end

  def show
    @sale = Sale.find(params[:id])
    render json: @sale, serializer: V1::SaleSerializer, root: nil
  end

  def create
    @sale = Sale.new(sale_params)
    @sale.user_id = current_v1_user.id
    ## Workaround until issue resolved at clients
    # Add 4 hours to start time
    @sale.start_at = @sale.start_at + 4.hours
    if @sale.save
      render json: @sale, serializer: V1::SaleSerializer
    else
      head 422
    end
  end

  def update
    @sale = Sale.find(params[:id])
    @sale.user_id = current_v1_user.id
    if @sale.update(sale_params)
      render json: @sale, serializer: V1::SaleSerializer
    else
      head 422
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    return head 422 if @sale.user_id != current_v1_user.id
    if @sale.destroy
      render status: 200
    end
  end

  def me
    @sales = current_v1_user.sales
    render json: @sales, each_serializer: V1::SaleSerializer
  end

  private

  def sale_params
    params.permit(:start_at, :organic, :active, :about, :hours, veg_list: [])
  end
end