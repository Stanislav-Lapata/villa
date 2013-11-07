class Contact < ActiveRecord::Base
  after_create :send_notification

  private

    def send_notification
      Notifier.new_contact_notification(self).deliver
    end
end
