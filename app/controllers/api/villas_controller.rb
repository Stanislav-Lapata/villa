module Api
  class VillasController < BaseController
    def index
      @villas = Villa.search(params[:q])
      @villas = @villas.result(distinct: true)
    end

    def show
      @villa = Villa.find(params[:id])
    end
  end
end
