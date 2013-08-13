ActiveAdmin.register Villa do
  index do
    column :name
    column :area
    column :price_from
    column :price_to
    column :bedrooms
    column :sleeps_up_to
    default_actions
  end

  filter :name

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :area
      f.input :price_from
      f.input :price_to
      f.input :bedrooms
      f.input :sleeps_up_to
    end

    f.inputs "Description" do
      f.input :description
    end

    f.inputs "Services & Facilities" do
      f.input :services
      f.input :facilities
    end

    f.actions
  end

  controller do
    def permitted_params
      params.permit villa: [:name, :description, :price_from, :price_to, :area_id, :facilities, :services, :bedrooms, :sleeps_up_to]
    end
  end
end
