class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  respond_to :html

  before_action :set_locale

  def set_locale
    I18n.locale = if request.domain == "phuketrenthouse.ru"
                  :ru
                else
                  session[:locale] || I18n.default_locale
                end
  end
end
