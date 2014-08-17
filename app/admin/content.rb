ActiveAdmin.register Content do
  index do
    column :kind
    actions
  end

  show do
    attributes_table do
      row :kind
      row :value
      row :value_ru
      row :keywords
      row :keywords_ru
      row :description
      row :description_ru
    end
  end

  form do |f|
    f.inputs do
      f.input :kind, colelction: Content.kind.values
    end

    f.inputs "Text", id: 'text' do
      f.input :value
      f.input :value_ru
    end

    f.inputs "Meta", id: 'meta' do
      f.input :keywords
      f.input :keywords_ru
      f.input :description
      f.input :description_ru
    end

    f.actions
  end

  controller do
    def permitted_params
      params.permit content: [ :kind, :value, :value_ru, :keywords, :keywords_ru, :description, :description_ru ]
    end
  end
end
