class HomeController < ApplicationController

  def index
    if @villa = Villa.find_by_domain(request.domain)
      render 'villa/show', layout: 'villa'
    else
      @areas = Area.for_home_page.includes(villas: :images)
    end
  end

  def list
    respond_to do |format|
      format.html { render layout: false }
    end
  end

  def gallery
    render 'villa/gallery', layout: 'villa'
  end

  def description
    render 'villa/description', layout: 'villa'
  end

  def contact
    render 'villa/contact', layout: 'villa'
  end
end
