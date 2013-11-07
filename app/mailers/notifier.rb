class Notifier < ActionMailer::Base
  default from: "Luxury Rentals And Sales <ez@luxuryrentalsandsales.asia>"

  def new_contact_notification(contact)
    body = ''.tap do |out|
      out << "Full name: #{contact.first_name} #{contact.last_name} \n"
      out << "Phone: #{contact.phone} \n"
      out << "Email: #{contact.email} \n"
      out << "Message: #{contact.message} \n"
    end.html_safe

    mail to: "oleghaidul@gmail.com", subject: "New Contact", body: body
  end
end
