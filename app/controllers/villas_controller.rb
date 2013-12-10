class VillasController < ApplicationController
  before_action :set_filters

  def index
    @q = Villa.search(params[:q])
    @villas = @q.result(distinct: true)
    @areas = Area.for_rent.roots
    @recent_villas = Villa.recent.for_rent.limit(4)
  end

  def sales
    @q = Villa.search(params[:q])
    @villas = @q.result(distinct: true)
    @areas = Area.for_sale.roots
    @recent_villas = Villa.recent.for_sale.limit(4)
  end

  def show
    @villa = Villa.find(params[:id])
  end

  private

    def set_filters
      params[:q] ||= {}
      params[:q][:bedrooms_gteq] ||= 3
      params[:q][:bedrooms_gteq] ||= 8
      params[:q][:price_from_gteq] ||= 1000
      params[:q][:price_from_lteq] ||= 3000
    end
end
