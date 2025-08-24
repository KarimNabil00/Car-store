class OrdersController < ApplicationController
    def new
    @car = Car.find(params[:car_id])
    @order = @car.orders.build
    @order.build_customer
    end
  def create
    @car = Car.find(params[:car_id])
    @order = @car.orders.build(order_params)
    @order.status = :pending
    # recaptcha_valid = verify_recaptcha(model: @user, action: 'registration')

    # if recaptcha_valid 
       if @order.save
        @order.customer.reload
        @order.customer.send_confirmation_email(@order) 
        # @car.update(available: false) 
        redirect_to cars_path, notice: 'Order created successfully. Please check your email to confirm and complete your order.'
       else
        render :new , status: :unprocessable_entity
       end
    # else
    #   render :new , status: :unprocessable_entity
    # end
  end
  def confirm
    @order = Order.find(params[:id])
    customer = @order.customer
    if customer.confirm_token == params[:token]
      customer.confirm_email!
      @order.confirm!
      redirect_to cars_path, notice: 'Your email has been confirmed and your order is now confirmed.'
    else
      redirect_to cars_path, alert: 'Invalid confirmation token.'
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