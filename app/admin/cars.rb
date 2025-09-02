ActiveAdmin.register Car do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  ## app/admin/car.rb

  # Permit all attributes including the image
  permit_params :make_id, :car_model_id, :year, :price, :color, :description, :available, :image

  # Index page configuration
index do
    selectable_column
    column :make do |car|
    car.make.name
    end
    column :model do |car|
      car.car_model.name if car.car_model
      end
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
  filter :make, 
              label: "Make", 
              as: :select, 
              collection: Make.all.map { |m| [m.name, m.id] }, 
              prompt: "Select a Make"
  filter :car_model, as: :select, collection: proc { CarModel.order(:name).pluck(:name, :id) }
  filter :year
  filter :price
  filter :color
  filter :available

  # Show page configuration
  show do
    attributes_table do
      row :make do |car|
        car.make.name if car.make
      end
      row :model do |car|
        car.car_model.name if car.car_model
      end
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
      f.input :make,
        label: "Make",
        as: :select,
        collection: Make.all.map { |m| [m.name, m.id] },
        input_html: {
          id: 'car_make_select',
          data: {
            models_by_make: CarModel.all.group_by(&:make_id).transform_values { |models| models.map { |m| { id: m.id, name: m.name } } }.to_json
          }
        },
        prompt: "Select a Make"

      f.input :car_model,
        label: "Model",
        as: :select,
        collection: [],
        input_html: { id: 'car_model_select' },
        prompt: "Select a Model"
      f.input :year
      f.input :price
      f.input :color,
       as: :select,
        collection: ['Red', 'Blue', 'Black', 'White', 'Silver', 'Gray', 'Green', 'Yellow', 'Other'],
        prompt: "Select a Color" 
      f.input :description, as: :text
      f.input :available
      f.input :image, as: :file, hint: 
      (if f.object.persisted? && f.object.image.attached?
    image_tag(f.object.image, width: 200)
  else
    content_tag(:span, "No image yet")
  end
)

    end
    f.actions
  end

  # Customize CSV export
  csv do
    column :make_id
    column :model
    column :year
    column :price
    column :color
    column :description
    column :available
    # Note: CSV export typically doesn't include images
  end
end
 
