ActiveAdmin.register Faq do
  index do
    column :question
    column :answer
    actions
  end

  show do
    attributes_table do
      row :question
      row :answer
    end
  end

  form do |f|
    f.inputs do
      f.input :question
      f.input :answer
    end

    f.actions
  end

  action_item :only => :show do
    link_to 'New FAQ', new_admin_faq_path
  end

  controller do
    def permitted_params
      params.permit faq: [ :question, :answer ]
    end
  end
end
