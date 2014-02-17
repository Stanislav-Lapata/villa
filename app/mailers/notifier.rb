class Notifier < ActionMailer::Base
  default from: "Luxury Rentals And Sales <info@zapestate.com>"

  def new_contact_notification(contact)
    body = ''.tap do |out|
      out << "Full name: #{contact.full_name} \n"
      out << "Phone: #{contact.phone} \n"
      out << "Email: #{contact.email} \n"
      out << "Message: #{contact.message} \n"
    end.html_safe

    mail to: "info@zapestate.com", subject: "New Contact", body: body
  end

  def new_request_notification(request)
    body = ''.tap do |out|
      out << "Villa: #{request.villa.name} (##{request.villa.id}) \n"
      out << "Full name: #{request.full_name} \n"
      out << "Email: #{request.email} \n"
      out << "Check In: #{request.check_in} \n"
      out << "Check Out: #{request.check_out} \n"
      out << "Comments: #{request.comments} \n"
    end.html_safe

    mail to: "info@zapestate.com", subject: "New Request", body: body
  end

  def new_owner_request_notification(villa, info)
    body = ''.tap do |out|
      out << info[:info]
    end.html_safe

    from = EmailList.find(info[:sender_email]).try(:email)

    mail to: villa.owner_email, subject: info[:subject], body: body, from: from
  end
end
