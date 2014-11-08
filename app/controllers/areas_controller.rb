class AreasController < ApplicationController
  def index
    @areas = Area.roots
  end

  def show
    @area = Area.find(params[:id])
    @villas = Villa.search(area_id_place_eq: @area.id).result(distinct: true).page(params[:page]).per(3)
  end

  def for_admin
    @areas = Area.ransack(params[:q]).result
  end
end
