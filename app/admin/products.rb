ActiveAdmin.register Product do
  permit_params :name, :price, :stock, :description

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :stock
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :stock
      f.input :description
    end
    f.actions
  end
end
