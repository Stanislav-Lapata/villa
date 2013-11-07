ActiveAdmin.register Contact do
  index do
    column "Full Name" do |contact|
      contact.full_name
    end
    column :phone
    column :email
    column :message
    default_actions
  end

  actions :index, :show, :destroy

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :phone
      row :email
      row :message
    end
  end
end
