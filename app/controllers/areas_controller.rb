class AreasController < ApplicationController
  def areas
    respond_to do |format|
      format.html { render layout: false }
    end
  end
end
