class MakesController < ApplicationController
  def show
    @make = Make.find(params[:id])
    @cars = @make.cars.where(available: true)
  end
end
