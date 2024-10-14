class RegioesController < ApplicationController

  def index
    @regioes = Regiao.all
    render json: @regioes
  end
end
