class AreasController < ApplicationController
  def index
    @areas = Area.roots
  end

  def show
    @area = Area.find(params[:id])
  end

  def for_admin
    @areas = Area.ransack(params[:q]).result
  end
end
