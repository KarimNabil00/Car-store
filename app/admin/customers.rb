ActiveAdmin.register Customer do
  permit_params :id, :name, :email, :phone_number, :city_id 
  # Index page configuration
  index do
    selectable_column
    column :id
    column :name
    column :email
    column :phone_number
    column :city do |customer|
      customer.city.name if customer.city
    end
    column :email_confirmed
    actions
  end
  # Filter options
  filter :name
  filter :email
  filter :phone_number
  filter :city, as: :select, collection: City.all.map { |c| [c.name, c.id] }, prompt: "Select a City"
  # Show page configuration
  show do
    attributes_table do
      row :name
      row :email
      row :phone_number
      row :city do |customer|
        customer.city.name if customer.city
      end
    end
  end
  form do |f|
    f.inputs do
      f.input :name , label: "Customer Name" , prompt: "Enter Customer Name" 
      f.input :email , label: "Email Address", prompt: "Enter Email Address"
      f.input :phone_number , label: "Phone Number" , prompt: "Enter Phone Number"
      f.input :city, as: :select, collection: City.all.map { |c| [c.name, c.id] }, prompt: "Select a City"
    end
    f.actions
  end
end