module Api
  class VillasController < BaseController
    def index
      @villas = Villa.search(params[:q])
      @villas = @villas.result(distinct: true).page(params[:page]).per(30)
    end

    def show
      @villa = Villa.find(params[:id])
    end

    def update
      @villa = Villa.find(params[:id])
      @villa.update_attributes(:villa)
    end
  end
end
