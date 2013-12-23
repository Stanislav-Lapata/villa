class HomeController < ApplicationController
  def setup_locale
    session[:locale] = params[:locale]
    I18n.locale = session[:locale]
    redirect_to :back
  end
end
