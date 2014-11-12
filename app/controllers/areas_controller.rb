class AreasController < ApplicationController
  def index
    @areas = Area.roots
  end

  def show
    @area = Area.find(params[:id])
    params[:q][:area_id_place_eq] = [@area.id.to_s]
    params[:select_all] = [@area.id.to_s] unless @area.parent
    @villas = Villa.search(params[:q]).result(distinct: true).page(params[:page]).per(3)
  end

  def for_admin
    @areas = Area.ransack(params[:q]).result
  end
end
