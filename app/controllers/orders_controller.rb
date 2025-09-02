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
      if @order.save
        # @order.customer.reload
        @order.customer.send_confirmation_email(@order) 
        redirect_to pending_order_path(@order)
      else
        render :new , status: :unprocessable_entity
      end
  end


  def pending 
    order = Order.find(params[:id])
    unless order.pending?
      redirect_to cars_path, notice: 'Your email has been confirmed and your order is now confirmed.'
    end 
  end


  def verify_customer
    email = params[:email]
    @customer = Customer.find_by(email: email)
    if @customer
      @car = Car.find(params[:car_id])
      @order = @car.orders.build(customer: @customer) 
      @order.save
      @customer.regenerate_confirmation_token!  
      @order.customer.send_confirmation_email(@order)
      redirect_to pending_order_path(@order), notice: 'A confirmation email has been sent to your email address. Please check your email to confirm and complete your order.'
    else
       render :verify_customer, status: :unprocessable_entity 
    end
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