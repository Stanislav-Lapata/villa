module Snapshots
  class SalesController < BaseController
    def index
      @villas = Villa.where(sale: true)
    end

    def show
      @villa = Villa.find(params[:id])
    end
  end
end
