module Api
  class AreasController < BaseController
    def index
      @areas = Area.roots
    end

    def show
      @area = Area.find(params[:id])
    end

    def home
      @areas = Area.for_home_page.includes(villas: :images)
    end

    def for_admin
      @areas = Area.ransack(params[:q]).result
    end

    def phuket
      @areas = Area.phuket
      render :index
    end
  end
end
