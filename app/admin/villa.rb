ActiveAdmin.register Villa do
  index do
    column :name
    column :area
    column :price_from
    column :price_to
    column :location
    column :bedrooms
    column :sleeps_up_to
    default_actions
  end

  filter :name

  form(:html => { multipart: true }) do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :area
      f.input :price_from
      f.input :price_to
      f.input :location
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

    f.inputs "Photos" do
      f.has_many :images do |i|
        i.input :image, as: :file, hint: f.template.image_tag(i.object.image.url(:thumb))
        i.buttons do
          link_to "Delete", admin_image_path(i.object), method: "delete", class: "button", data: { confirm: 'Are you sure?' } unless i.object.new_record?
        end
      end
    end

    f.actions
  end

  controller do
    def permitted_params
      params.permit villa: [
                            :name, :description, :price_from, :price_to, :location,
                            :area_id, :facilities, :services, :bedrooms, :sleeps_up_to,
                            images_attributes: [:id, :image, :_destroy]
                           ]
    end
  end
end
