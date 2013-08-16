class VillasController < ApplicationController
  def show
    @villa = Villa.find(params[:id])
  end
end
