ActiveAdmin.register Villa do
  index do
    column :name
    column :area
    column :rental
    column :price_from
    column :price_to
    column :sale
    column :sale_price
    column :location
    column :bedrooms
    column :bathrooms
    column :sleeps_up_to
    default_actions
  end

  show do |villa|
    h1 villa.name
    attributes_table do
      row :name
      row :rental
      row :price_from
      row :price_to
      row :sale
      row :sale_price
      row :area do
        villa.area && villa.area.pretty_name
      end
      row :location
      row :bedrooms
      row :bathrooms
      row :sleeps_up_to
      row :services
      row :facilities
      row :description
      row :created_at
      row :updated_at
    end
    div class: 'sortable' do
      ''.tap do |out|
        villa.images.each do |image|
          out << content_tag(:div, class: 'admin-villa-form-images', id: "image_#{image.id}",  "data-sortable-link" => "#{update_positions_admin_images_url}") do
            image_tag(image.image.url(:thumb), size: "155x100") +
            content_tag(:p) do
              link_to("Delete", admin_image_url(image), method: :delete, data: { confirm: 'Are you sure?' })
            end
          end
        end
        out << content_tag(:br)
      end.html_safe
    end
  end

  form(:html => { multipart: true }) do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :area_id, input_html: {class: 'admin-villa-area'}
      f.input :rental
      f.input :price_from
      f.input :price_to
      f.input :sale
      f.input :sale_price
      f.input :location
      f.input :bedrooms
      f.input :bathrooms
      f.input :sleeps_up_to
    end

    f.inputs "Seasonal Prices" do
      f.input :low_month, label: 'Low Season', placeholder: 'Per Month'
      f.input :low_week, label: false, placeholder: 'Per Week'
      f.input :low_night, label: false, placeholder: 'Per Night'

      f.input :high_month, label: 'High Season', placeholder: 'Per Month'
      f.input :high_week, label: false, placeholder: 'Per Week'
      f.input :high_night, label: false, placeholder: 'Per Night'

      f.input :peak_month, label: 'Peak Season', placeholder: 'Per Month'
      f.input :peak_week, label: false, placeholder: 'Per Week'
      f.input :peak_night, label: false, placeholder: 'Per Night'
    end

    f.inputs "Description" do
      f.input :description
    end

    f.inputs "Services & Facilities" do
      f.input :services
      f.input :facilities
    end

    f.inputs "Photos" do
      f.template.content_tag(:div, class: 'sortable') do
        ''.tap do |out|
          f.object.images.each do |image|
            out << f.template.content_tag(:div, class: 'admin-villa-form-images', id: "image_#{image.id}",  "data-sortable-link" => "#{update_positions_admin_images_url}") do
              f.template.image_tag(image.image.url(:thumb), size: "155x100") +
              f.template.content_tag(:p) do
                f.template.link_to("Delete", f.template.admin_image_url(image), method: :delete, data: { confirm: 'Are you sure?' })
              end
            end
          end
          out << f.template.content_tag(:br)
          out << file_field_tag("images_image", multiple: true, name: "villa[images_attributes][][image]")
        end.html_safe
      end
    end

    f.inputs "Google Map" do
      f.template.content_tag(:script, '', 'type' => 'text/javascript', src: 'http://maps.google.com/maps/api/js?sensor=false') +
      f.template.content_tag(:div, id: 'map', "ng-app" => "Villa", "ng-controller" => "AdminGmapsCtrl", "ng-init" => "get_villa(#{villa.to_json})") do
        ''.tap do |out|
          out << f.template.content_tag('google-map', '',
                                                   center: "position.coords",
                                                   draggable: "true",
                                                   zoom: "zoom",
                                                   markers: "markersProperty",
                                                   "mark-click" => "true",
                                                   fit: 'false',
                                                   latitude: "latitude",
                                                   longitude: "longitude",
                                                   style: "height: 400px; width: 600px; display: block;")

          out << f.template.hidden_field_tag('villa[latitude]', '{{latitude}}', "ng-model" => "latitude", "set-default" => "#{villa.latitude}")
          out << f.template.hidden_field_tag('villa[longitude]', '{{longitude}}', "ng-model" => "longitude", "set-default" => "#{villa.longitude}")
          out << f.template.hidden_field_tag('villa[zoom]', '{{zoom}}', "ng-model" => "zoom", "set-default" => "#{villa.zoom.to_i}")
        end.html_safe
      end
    end

    f.actions
  end

  controller do
    def permitted_params
      params.permit villa: [
                            :name, :description, :price_from, :price_to, :location,
                            :area_id, :facilities, :services, :bedrooms, :sleeps_up_to,
                            :sale_price, :bathrooms, :rental, :sale, :position, :latitude,
                            :longitude, :zoom, :low_month, :peak_month, :low_week, :low_night,
                            :high_week, :high_night, :peak_week, :peak_night, :high_month,
                            images_attributes: [:id, :image, :_destroy, :url]
                           ]
    end
  end
end
