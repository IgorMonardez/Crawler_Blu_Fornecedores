class FornecedoresController < ApplicationController



  def index
    @fornecedores = Fornecedor.all

    @fornecedores = filtra_fornecedores(@fornecedores, filtro_params)
    render json: @fornecedores
  end

  private

  def filtra_fornecedores(fornecedores, filtro_params)
    fornecedores = fornecedores.where("nome LIKE ?", "%#{params[:nome]}%") if params[:nome].present?
    fornecedores = fornecedores.where(regiao_id: params[:regiao_id]) if params[:regiao_id].present?
    fornecedores = fornecedores.where(segmento_id: params[:segmento_id]) if params[:segmento_id].present?


    fornecedores
  end

  def filtro_params
    params.permit(:nome, :regiao_id, :segmento_id)
  end
end
