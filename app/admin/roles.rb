ActiveAdmin.register AccountBlock::Role, as: "Role" do
  permit_params :name, :status

  index do
    selectable_column
    id_column
    column :name
    column :status
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :status
    end
    f.actions
  end
end