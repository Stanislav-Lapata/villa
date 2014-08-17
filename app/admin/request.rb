ActiveAdmin.register Request do
  index do
    column 'full name' do |request|
      "#{request.last_name} #{request.first_name}"
    end
    column :villa
    column :email
    column :budget_per_night
    column :phone
    column :check_in
    column :check_out
    column :comments
    actions
  end

  filter :name

  form do |f|
    f.inputs "Admin Details" do
      f.input :last_name
      f.input :first_name
      f.input :email
      f.input :budget_per_night
      f.input :phone
      f.input :check_in
      f.input :check_out
    end

    f.actions
  end

  controller do
    def permitted_params
      params.permit request: [:first_name, :last_name, :check_in, :check_out, :comments, :email, :budget_per_night, :phone]
    end
  end
end
