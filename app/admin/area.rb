ActiveAdmin.register Area do
  config.sort_order = 'lft_asc'

  sortable_tree_member_actions

  index do
    render "nested_areas"
    column "&#9650;".html_safe do |resource|
      link_to("&#9650;".html_safe, self.send(:"move_up_admin_#{resource.class.name.underscore.gsub("/", "_")}_path", resource), :class => "arrow") if resource.left_sibling
    end
    column "&#9660;".html_safe do |resource|
      link_to("&#9660;".html_safe, self.send(:"move_down_admin_#{resource.class.name.underscore.gsub("/", "_")}_path", resource), :class => "arrow") if resource.right_sibling
    end
    column :name do |resource|
      "<span style=\"padding-left:#{resource.depth*24}px\">&bull; #{resource[:name]}</span>".html_safe
    end
    column :show_on_home_page do |resource|
      if resource.show_on_home_page?
        status_tag('true', :ok)
      else
        status_tag('false', :warn)
      end
    end
    column :rental
    column :sale
    actions
  end


  show do
    attributes_table do
      row :name
      row :test do
        render "nested_areas"
      end
    end

  end

  filter :name

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :parent
      f.input :show_on_home_page
      f.input :rental
      f.input :sale
      f.input :top
      f.input :left
      f.input :left_tail
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit area: [:name, :parent_id, :show_on_home_page, :position, :rental, :sale, :top, :left, :left_tail]
    end
  end
end
