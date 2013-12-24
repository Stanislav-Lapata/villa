class Request < ActiveRecord::Base
  belongs_to :villa
  validates :first_name, :last_name, :email, :check_in, :check_out, presence: true

  after_create :send_notification

  def full_name
    "#{first_name} #{last_name}"
  end

  private

    def send_notification
      Notifier.new_request_notification(self).deliver
    end
end
