class FornecedoresController < ApplicationController
  def index
    @fornecedor = Fornecedor.all
    render json: @fornecedor
  end
end
