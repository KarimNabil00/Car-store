ActiveAdmin.register Car do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  ## app/admin/car.rb

  # Permit all attributes including the image
  permit_params :make, :model, :year, :price, :color, :description, :available, :image

  # Index page configuration
index do
    selectable_column
    column :make
    column :model
    column :year
    column :price
    column :color
    column :available
    column :image do |car|
      if car.image.attached?
        image_tag url_for(car.image), width: '100'
      else
        content_tag(:span, "No image", class: "empty")
      end
    end
    actions
  end

  # Filter options
  filter :make
  filter :model
  filter :year
  filter :price
  filter :color
  filter :available

  # Show page configuration
  show do
    attributes_table do
      row :make
      row :model
      row :year
      row :price
      row :color
      row :description
      row :available
      row :image do |car|
        if car.image.attached?
          image_tag url_for(car.image), width: '400'
        else  
          "No image available"
        end
      end
    end
    active_admin_comments
  end

  # Form configuration
  form do |f|
    f.inputs 'Car Details' do
      f.input :make
      f.input :model
      f.input :year
      f.input :price
      f.input :color, as: :select, collection: ['Red', 'Blue', 'Black', 'White', 'Silver', 'Gray', 'Green', 'Yellow', 'Other']
      f.input :description, as: :text
      f.input :available
      f.input :image, as: :file, hint: f.object.image.attached? ? image_tag(f.object.image, width: '200') : content_tag(:span, "No image yet")
    end
    f.actions
  end

  # Customize CSV export
  csv do
    column :make
    column :model
    column :year
    column :price
    column :color
    column :description
    column :available
    # Note: CSV export typically doesn't include images
  end
end
  # or
  #
  # permit_params do
  #   permitted = [:make, :model, :year, :price, :color, :description, :available]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
