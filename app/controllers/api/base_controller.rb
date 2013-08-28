class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  respond_to :json

  def invalid_resource!(resource)
    @resource = resource
    render "api/errors/invalid_resource", status: 422
  end
end
