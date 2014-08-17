ActiveAdmin.register HomePhoto do
  scope :for_home
  scope :for_rent
  scope :for_sale

  index do
    column :image do |image|
      image_tag image.image, height: 100
    end
    actions
  end

  form(:html => { multipart: true }) do |f|
    f.inputs "Home Photos" do
      f.input :rentals
      f.input :sales
      f.input :image, as: :file
    end

    f.actions
  end

  controller do
    def permitted_params
      params.permit home_photo: [:rentals, :sales, :image, :_destroy]
    end
  end
end
