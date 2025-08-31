class HomeController < ApplicationController
  def index
    @makes = Make.all
    @random_cars = Car.where(available: true).order("RANDOM()").limit(4)
  end
end
