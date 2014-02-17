ActiveAdmin.register EmailList do
  controller do
    def permitted_params
      params.permit email_list: [:email]
    end
  end
end
