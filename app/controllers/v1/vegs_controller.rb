class V1::VegsController < ApplicationController
  def index
    @vegs = ActsAsTaggableOn::Tag.all.pluck(:name)
    render json: @vegs
  end
end