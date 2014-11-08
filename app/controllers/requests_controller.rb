class RequestsController < ApplicationController
  respond_to :js, only: :create

  def create
    if villa_id = params[:villa_id]
      @villa = Villa.find(params[:villa_id])
      @request = @villa.requests.build(request_params)
      @request.save
    else
      @request = Request.create(request_params)
    end
    respond_with @request
  end

  private

    def request_params
      params.require(:request).permit(:first_name, :last_name, :email, :budget_per_night, :phone, :check_in, :check_out, :comments)
    end
end
