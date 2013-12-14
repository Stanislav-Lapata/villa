ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Requests" do
          ul do
            Request.all.map do |request|
              li(link_to(request.full_name, admin_request_path(request)) + " (#{request.created_at.to_date})")
            end
          end
        end
      end

      column do
        panel "Contacts" do
          ul do
            Contact.all.map do |contact|
              li(link_to(contact.full_name, admin_contact_path(contact)) + " (#{contact.created_at.to_date})")
            end
          end
        end
      end
    end
  end
end
