module Api
  class HomePhotosController < BaseController
    def index
      @photos = HomePhoto.all
    end
  end
end
