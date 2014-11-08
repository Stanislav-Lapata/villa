class VillasController < ApplicationController
  def index
    @q = Villa.search(params[:q])
    @villas = @q.result(distinct: true).page(params[:page]).per(3)
  end

  def show
    @villa = Villa.find(params[:id])
    @request = @villa.requests.build
    @hash = Gmaps4rails.build_markers([@villa]) do |villa, marker|
      marker.lat villa.latitude
      marker.lng villa.longitude
    end
  end
end
