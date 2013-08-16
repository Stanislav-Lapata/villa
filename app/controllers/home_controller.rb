class HomeController < ApplicationController
  def index
    @areas = Area.for_home_page.includes(villas: :images)
  end
end
