class Contact < ActiveRecord::Base
  after_create :send_notification

  def full_name
    "#{first_name} #{last_name}"
  end

  private

    def send_notification
      Notifier.new_contact_notification(self).deliver
    end
end
