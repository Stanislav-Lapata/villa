class RequestsController < ApplicationController
  def create
    @villa = Villa.find(params[:villa_id])
    @request = @villa.requests.build(request_params)
    @request.save
  end

  private

    def request_params
      params.require(:request).permit(:first_name, :last_name, :email, :check_in, :check_out, :comments)
    end
end
