ActiveAdmin.register Order do
  permit_params :customer_id, :car_id, :created_at , :updated_at , :status 
  # Index page configuration 
  index do
    selectable_column
    column :customer do |order|
      order.customer.name if order.customer
    end
    column "Car" do |order|
   if order.car
    "#{order.car.make.name} #{order.car.car_model.name}"
   end
  end
    column :created_at
    column :status
    actions
  end
end
