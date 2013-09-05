module Api
  class ContactsController < BaseController
    def create
      @contact = Contact.new(contact_params)
      if @contact.save
        render :show
      else
        invalid_resource!(@contact)
      end
    end

    private

      def contact_params
        params.require(:contact).permit(:first_name, :last_name, :email, :phone, :message)
      end
  end
end
