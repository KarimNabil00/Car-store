class OrdersController < ApplicationController
    def new
    @car = Car.find(params[:car_id])
    @order = @car.orders.build
    @order.build_customer
    end
  def create
    @car = Car.find(params[:car_id])
    @order = @car.orders.build(order_params)
    if @order.save
      @car.update(available: false) 
      redirect_to cars_path, notice: 'Order was successfully created.'
    else
      render :new
    end
  end
  private
    def order_params
      params.require(:order).permit(
        :car_id,
        customer_attributes: [:name, :email, :phone_number , :city_id]
      )
    end
end