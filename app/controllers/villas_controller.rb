class VillasController < ApplicationController
  def show_villa
    respond_to do |format|
      format.html { render layout: false }
    end
  end

  def show_sales_villa
    respond_to do |format|
      format.html { render layout: false }
    end
  end


  def list
    respond_to do |format|
      format.html { render layout: false }
    end
  end

  def sales
    respond_to do |format|
      format.html { render layout: false }
    end
  end
end
