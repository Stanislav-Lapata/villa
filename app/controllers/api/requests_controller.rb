module Api
  class RequestsController < BaseController
    def create
      @request = Request.new(request_params)
      if @request.save
        render :show
      else
        invalid_resource!(@request)
      end
    end

    private

      def request_params
        params.require(:request).permit(:first_name, :last_name, :email, :check_in, :check_out, :comments)
      end
  end
end
