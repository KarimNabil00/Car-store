class CustomerMailer < ApplicationMailer
    default from: 'no-reply@yourdomain.com'

    def confirmation_email(customer, order)
    @customer = customer
    @order = order
    @confirmation_url = confirm_order_url(id: @order.id, token: customer.confirm_token)     
    mail(
      to: @customer.email,
      subject: 'Confirm Your Order and Email Address'
    )
  end
end
