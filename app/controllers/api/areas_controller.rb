module Api
  class AreasController < BaseController
    def index
      @areas = Area.roots
    end

    def home
      @areas = Area.for_home_page.includes(villas: :images)
    end
  end
end
