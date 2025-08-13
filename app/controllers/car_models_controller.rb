# class CarModelsController < ApplicationController
#   def for_make
#     render json: CarModel.where(make_id: params[:make_id]).order(:name).select(:id, :name)
#   end
# end