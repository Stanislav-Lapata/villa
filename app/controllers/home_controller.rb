class HomeController < ApplicationController
  before_filter :find_villa, except: :list

  def index
    if @villa
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

  def rates
    render 'villa/rates', layout: 'villa'
  end

  def contact
    render 'villa/contact', layout: 'villa'
  end

  private

    def find_villa
      @villa = Villa.find_by_domain(request.domain)
    end
end
