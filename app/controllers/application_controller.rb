class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :check_for_phuket

  def set_locale
    locale = request.domain == "phuketrenthouse.ru" ? :ru : :en
    I18n.locale = locale
  end

  def check_for_phuket
    @phuket = request.domain.include?('phuketrenthouse')
  end
end
