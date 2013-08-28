module Api
  class AreasController < BaseController
    def index
      @areas = Area.roots
    end
  end
end
