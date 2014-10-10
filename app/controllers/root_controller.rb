# Controller for root url

class RootController < ApplicationController

  def index
    render json: { response: 'instance is on service' }
  end

end