class HomeController < ApplicationController
  def index
    @areas = Area.for_home_page.includes(villas: :images)
  end

  def list
    respond_to do |format|
      format.html { render layout: false }
    end
  end
end
