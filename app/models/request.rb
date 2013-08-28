class Request < ActiveRecord::Base
  belongs_to :villa
  validates :first_name, :last_name, :email, :check_in, :check_out, presence: true
end
