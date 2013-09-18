module Api
  class SubscribesController < BaseController
    def create
      @subscribe = Subscribe.new(subscribe_params)
      if @subscribe.save
        render :show
      else
        invalid_resource!(@subscribe)
      end
    end

    private

      def subscribe_params
        params.require(:subscribe).permit(:name, :email)
      end
  end
end
