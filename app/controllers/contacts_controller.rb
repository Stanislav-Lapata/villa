class ContactsController < ApplicationController
  respond_to :js, only: :create

  def create
    @contact = Contact.new(contact_params)
    @contact.save
    respond_with @contact
  end

  private

    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :phone, :message)
    end
end
