ActiveAdmin.register Area do
  index do
    column :name
    default_actions
  end

  filter :name

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit area: [:name]
    end
  end
end
