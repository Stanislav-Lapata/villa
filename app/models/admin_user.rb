class AdminUser < ActiveRecord::Base
  extend Enumerize
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  enumerize :role, in: [:admin, :user], default: :user

  def admin?
    role.try(:admin?)
  end
end
