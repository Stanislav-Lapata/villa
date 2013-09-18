ActiveAdmin.register Subscribe do
  menu label: 'Subscriptions'
  index do
    column :name
    column :email
    column :created_at
    default_actions
  end
end
