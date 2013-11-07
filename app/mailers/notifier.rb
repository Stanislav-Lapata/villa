class Notifier < ActionMailer::Base
  default from: "ez@luxuryrentalsandsales.asia"

  def new_contact_notification(contact)
    body = ''.tap do |out|
      out << "Full name: #{contact.first_name} #{contact.last_name}"
      out << "<br>"
      out << "Phone: #{contact.phone}"
      out << "<br>"
      out << "Email: #{contact.email}"
      out << "<br>"
      out << "Message: #{contact.message}"
    end.html_safe

    mail to: "oleghaidul@gmail.com", subject: "New Contact", body: body
  end
end