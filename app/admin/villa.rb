ActiveAdmin.register Villa do
  index do
    column :id
    column :name
    column :domain
    column :area
    column :rental
    column :price_from
    column :price_to
    column :sale
    column :sale_price
    column :location
    column :bedrooms
    column :sleeps_up_to
    actions
  end

  show do |villa|
    h1 villa.name
    attributes_table do
      row :name
      row :owner_email if current_admin_user.admin?
      row :domain
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
      row :description
      row :description_ru
      row :price_guide
      row :price_guide_ru
      row :yacht_rentals
      row :car_rentals
      row :real_estate
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
    f.inputs "Type" do
      f.input :rental
      f.input :price_from, as: :string
      f.input :price_to, as: :string
      f.input :sale
      f.input :sale_price, as: :string
      f.input :yacht_rentals
      f.input :yacht_price
      f.input :car_rentals
      f.input :car_price
    end

    if current_admin_user.admin?
      f.inputs "Owner" do
        f.input :owner_email
      end
    end

    f.inputs "Admin Details" do
      f.input :name
      f.input :domain
      f.input :area_id, input_html: {class: 'admin-villa-area'}
      f.input :location
      f.input :bedrooms, as: :string
      f.input :bathrooms, as: :string
      f.input :sleeps_up_to, as: :string
      f.input :price_guide
      f.input :price_guide_ru
      f.input :price_guide_sale
      f.input :price_guide_sale_ru
    end

    f.inputs "Seasonal Prices", id: 'seasonal_prices' do
      f.input :low_month, label: 'Low Season', placeholder: 'Per Month', as: :string
      f.input :low_week, label: false, placeholder: 'Per Week', as: :string
      f.input :low_night, label: false, placeholder: 'Per Night', as: :string

      f.input :high_month, label: 'High Season', placeholder: 'Per Month', as: :string
      f.input :high_week, label: false, placeholder: 'Per Week', as: :string
      f.input :high_night, label: false, placeholder: 'Per Night', as: :string

      f.input :peak_month, label: 'Peak Season', placeholder: 'Per Month', as: :string
      f.input :peak_week, label: false, placeholder: 'Per Week', as: :string
      f.input :peak_night, label: false, placeholder: 'Per Night', as: :string
    end

    f.inputs "Description" do
      f.input :description
      f.input :description_ru
      f.input :description_sale
      f.input :description_sale_ru
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

  action_item :only => :show do
    link_to 'New Villa', new_admin_villa_path
  end

  action_item do
    link_to 'New Info Request', info_request_admin_villas_path
  end

  collection_action :info_request do
  end

  collection_action :send_info_request, method: :post do
    @request_params = params[:info_request]
    @villas = Villa.ransack(@request_params).result(distinct: true)
  end

  collection_action :send_request, method: :post do
    info_params = params[:info]
    villa_ids = info_params[:villa_ids].split(',')
    villas = Villa.find(villa_ids)
    villas.each { |villa| villa.send_info(info_params) }
    redirect_to [:admin, Villa], notice: 'Success'
  end

  controller do
    def new
      @villa = Villa.new
      @villa.price_guide = I18n.t(:price_guide, scope: 'villa_info')
    end

    def permitted_params
      params.permit villa: [
                            :name, :domain, :description, :description_ru, :description_sale,
                            :description_sale_ru, :price_from, :price_to, :location, :owner_email,
                            :area_id, :facilities, :services, :bedrooms, :sleeps_up_to,
                            :sale_price, :bathrooms, :rental, :sale, :position, :latitude,
                            :longitude, :zoom, :low_month, :peak_month, :low_week, :low_night,
                            :high_week, :high_night, :peak_week, :peak_night, :high_month, :price_guide,
                            :price_guide_ru, :price_guide_sale, :price_guide_sale_ru, :house_rentals,
                            :house_sales, :yacht_rentals, :car_rentals,
                            images_attributes: [:id, :image, :_destroy, :url]
                           ]
    end
  end
end
