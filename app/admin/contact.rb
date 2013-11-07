ActiveAdmin.register Contact do
  index do
    column "Full Name" do |contact|
      "#{contact.first_name} #{contact.last_name}"
    end
    column :phone
    column :email
    column :message
    default_actions
  end

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
