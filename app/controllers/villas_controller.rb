class VillasController < ApplicationController
  before_action :set_filters
  before_action :find_villa, only: [:show, :show_sale, :show_yacht, :show_car, :show_estate_rental, :show_estate_sale]

  def index
    params[:q][:area_id_place_eq] ||= Area.where(name: 'Phuket').first.id
    @q = Villa.for_rent.search(params[:q])
    @villas = @q.result(distinct: true)
    @areas = Area.for_rent.roots
    @recent_villas = Villa.recent.for_rent.limit(4)
    @phuket = true
    @phuket_areas = Area.phuket
    @bali_areas = Area.bali
  end

  def bali
    @bali = true
    params[:q][:area_id_place_eq] ||= Area.where(name: 'Bali').first.id
    @q = Villa.for_rent.search(params[:q])
    @villas = @q.result(distinct: true)
    @areas = Area.for_rent.roots
    @recent_villas = Villa.recent.for_rent.limit(4)
    @bali_areas = Area.bali
    render :index
  end

  def sales
    params[:q][:area_id_place_eq] ||= Area.where(name: 'Phuket').first.id
    @q = Villa.for_sale.search(params[:q])
    @villas = @q.result(distinct: true)
    @areas = Area.for_sale.roots
    @recent_villas = Villa.recent.for_sale.limit(4)
    @phuket = true
    @phuket_areas = Area.phuket
  end

  def yacht_rentals
    @q = Villa.yacht_rentals.search(params[:q])
    @villas = @q.result(distinct: true)
    @areas = Area.roots
    @recent_villas = Villa.recent.yacht_rentals.limit(4)
  end

  def car_rentals
    @q = Villa.car_rentals.search(params[:q])
    @villas = @q.result(distinct: true)
    @areas = Area.roots
    @recent_villas = Villa.recent.car_rentals.limit(4)
  end

  def real_estate_rentals
    @q = Villa.search(params[:q])
    @villas = @q.result(distinct: true)
    @areas = Area.for_rent.roots
    @recent_villas = Villa.recent.for_sale.limit(4)
  end

  def real_estate_sales
    @q = Villa.search(params[:q])
    @villas = @q.result(distinct: true)
    @areas = Area.for_sale.roots
    @recent_villas = Villa.recent.for_sale.limit(4)
  end

  def show
    @rental = true
  end

  %w[sale yacht car estate_rental estate_sale].each do |action|
    define_method "show_#{action}" do
      instance_variable_set("@#{action}", true)
      render :show
    end
  end

  private

    def set_filters
      params[:q] ||= {}
    end

    def find_villa
      @villa = Villa.find(params[:id])
      @request = @villa.requests.build
      @hash = Gmaps4rails.build_markers([@villa]) do |villa, marker|
        marker.lat villa.latitude
        marker.lng villa.longitude
      end
    end
end
