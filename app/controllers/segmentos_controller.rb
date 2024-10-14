class SegmentosController < ApplicationController
  def index
    @segmentos = Segmento.all
    render json: @segmentos
  end
end
