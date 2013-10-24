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

  %w[gallery rates contact location].each do |action|
    define_method action do
      render "villa/#{action}", layout: 'villa'
    end
  end

  private

    def find_villa
      @villa = Villa.find_by_domain(request.domain)
    end
end
