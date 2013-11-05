ActiveAdmin.register HomePhoto do
  index do
    column :image
    default_actions
  end

  form(:html => { multipart: true }) do |f|
    f.inputs "Admin Details" do
      f.input :image, as: :file
    end

    f.actions
  end

  controller do
    def permitted_params
      params.permit home_photo: [:image, :_destroy]
    end
  end
end
