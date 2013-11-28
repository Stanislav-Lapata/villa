class PhuketController < ApplicationController
  def house_rentals
    respond_to do |format|
      format.html { render layout: false }
    end
  end
end
