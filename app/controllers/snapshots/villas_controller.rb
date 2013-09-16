module Snapshots
  class VillasController < BaseController
    def index
      @villas = Villa.where(rental: true)
    end

    def show
      @villa = Villa.find(params[:id])
    end
  end
end
