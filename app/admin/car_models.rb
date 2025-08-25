ActiveAdmin.register CarModel do
  permit_params :name, :make_id

  index do
    selectable_column
    id_column
    column :name
    column :make_id do |car_model|
      car_model.make.name
    end
    actions
  end

  filter :name
  filter :make

  form do |f|
    f.inputs do
      f.input :make
      f.input :name
    end
    f.actions
  end

end