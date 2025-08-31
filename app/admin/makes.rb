ActiveAdmin.register Make do
  permit_params :name , :logo

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :name
    end
    f.inputs do
      f.input :logo, as: :file
    end
    f.actions
  end

end