ActiveAdmin.register AccountBlock::Account, as: "Account" do 
  permit_params :first_name, :last_name, :email, :password, :full_phone_number, :role_id

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :full_phone_number
    column :role
    actions
  end

  form do |f|
    f.inputs do
      f.input :role_id, as: :select, collection: AccountBlock::Role.all.pluck(:name, :id)#, include_blank: false
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :full_phone_number
    end
    f.actions
  end
end