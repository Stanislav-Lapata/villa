class VillasController < ApplicationController
  def show_villa
    respond_to do |format|
      format.html { render layout: false }
    end
  end

  def list
    respond_to do |format|
      format.html { render layout: false }
    end
  end
end
