ActiveAdmin.register Faq do
  index do
    column :question
    column :answer
    default_actions
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
  controller do
    def permitted_params
      params.permit faq: [ :question, :answer ]
    end
  end
end
