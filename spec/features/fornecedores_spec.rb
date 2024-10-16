# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Fornecedores', type: :feature, js: true do
  context 'Sem filtro' do
    let!(:fornecedor) { create :fornecedor}
    before do
      visit '/fornecedores'
    end
    it 'com sucesso' do
      expect(page).to have_content(fornecedor.nome)
      expect(page).to have_content(fornecedor.segmento_id)
      expect(page).to have_content(fornecedor.regiao_id)
    end
  end
  context 'Com filtro' do
    let(:regiao) { create :regiao }
    let(:regiao_nao_filtrado) { create :regiao, nome: 'Não filtrado' }
    let(:segmento) { create :segmento }
    let(:segmento_nao_filtrado) { create :segmento, nome: 'Não filtrado' }
    let!(:fornecedor) { create :fornecedor, regiao: regiao, segmento: segmento }
    let!(:fornecedor_nao_filtrado) { create :fornecedor, regiao: regiao_nao_filtrado, segmento: segmento_nao_filtrado }
    before do
      visit "/fornecedores"
      sleep(2)
    end
    it 'de nome' do
      expect(page).to have_content(fornecedor.nome)
      expect(page).to have_content(fornecedor.segmento_id)
      expect(page).to have_content(fornecedor.regiao_id)
      expect(page).to have_content(fornecedor_nao_filtrado.nome)
      expect(page).to have_content(fornecedor_nao_filtrado.segmento_id)
      expect(page).to have_content(fornecedor_nao_filtrado.regiao_id)

      visit "/fornecedores?nome=#{fornecedor.nome}"
      sleep(2)

      expect(page).to have_content(fornecedor.nome)
      expect(page).to have_content(fornecedor.segmento_id)
      expect(page).to have_content(fornecedor.regiao_id)
      expect(page).to_not have_content(fornecedor_nao_filtrado.nome)
      expect(page).to_not have_content(fornecedor_nao_filtrado.segmento_id)
      expect(page).to_not have_content(fornecedor_nao_filtrado.regiao_id)
    end
    it 'de regiao_id' do
      expect(page).to have_content(fornecedor.nome)
      expect(page).to have_content(fornecedor.segmento_id)
      expect(page).to have_content(fornecedor.regiao_id)
      expect(page).to have_content(fornecedor_nao_filtrado.nome)
      expect(page).to have_content(fornecedor_nao_filtrado.segmento_id)
      expect(page).to have_content(fornecedor_nao_filtrado.regiao_id)

      visit "/fornecedores?regiao_id=#{fornecedor.regiao_id}"
      sleep(2)

      expect(page).to have_content(fornecedor.nome)
      expect(page).to have_content(fornecedor.segmento_id)
      expect(page).to have_content(fornecedor.regiao_id)
      expect(page).to_not have_content(fornecedor_nao_filtrado.nome)
      expect(page).to_not have_content(fornecedor_nao_filtrado.segmento_id)
      expect(page).to_not have_content(fornecedor_nao_filtrado.regiao_id)
    end
    it 'de segmento_id' do
      expect(page).to have_content(fornecedor.nome)
      expect(page).to have_content(fornecedor.segmento_id)
      expect(page).to have_content(fornecedor.regiao_id)
      expect(page).to have_content(fornecedor_nao_filtrado.nome)
      expect(page).to have_content(fornecedor_nao_filtrado.segmento_id)
      expect(page).to have_content(fornecedor_nao_filtrado.regiao_id)

      visit "/fornecedores?segmento_id=#{fornecedor.segmento_id}"
      sleep(2)

      expect(page).to have_content(fornecedor.nome)
      expect(page).to have_content(fornecedor.segmento_id)
      expect(page).to have_content(fornecedor.regiao_id)
      expect(page).to_not have_content(fornecedor_nao_filtrado.nome)
      expect(page).to_not have_content(fornecedor_nao_filtrado.segmento_id)
      expect(page).to_not have_content(fornecedor_nao_filtrado.regiao_id)
    end

    context 'Misto' do
      it 'nome e regiao' do
        expect(page).to have_content(fornecedor.nome)
        expect(page).to have_content(fornecedor.segmento_id)
        expect(page).to have_content(fornecedor.regiao_id)
        expect(page).to have_content(fornecedor_nao_filtrado.nome)
        expect(page).to have_content(fornecedor_nao_filtrado.segmento_id)
        expect(page).to have_content(fornecedor_nao_filtrado.regiao_id)

        visit "/fornecedores?nome=#{fornecedor.nome}&regiao_id=#{fornecedor.regiao_id}"
        sleep(2)

        expect(page).to have_content(fornecedor.nome)
        expect(page).to have_content(fornecedor.segmento_id)
        expect(page).to have_content(fornecedor.regiao_id)
        expect(page).to_not have_content(fornecedor_nao_filtrado.nome)
        expect(page).to_not have_content(fornecedor_nao_filtrado.segmento_id)
        expect(page).to_not have_content(fornecedor_nao_filtrado.regiao_id)

      end
      it 'nome e segmento' do
        expect(page).to have_content(fornecedor.nome)
        expect(page).to have_content(fornecedor.segmento_id)
        expect(page).to have_content(fornecedor.regiao_id)
        expect(page).to have_content(fornecedor_nao_filtrado.nome)
        expect(page).to have_content(fornecedor_nao_filtrado.segmento_id)
        expect(page).to have_content(fornecedor_nao_filtrado.regiao_id)

        visit "/fornecedores?nome=#{fornecedor.nome}&segmento_id=#{fornecedor.segmento_id}"
        sleep(2)

        expect(page).to have_content(fornecedor.nome)
        expect(page).to have_content(fornecedor.segmento_id)
        expect(page).to have_content(fornecedor.regiao_id)
        expect(page).to_not have_content(fornecedor_nao_filtrado.nome)
        expect(page).to_not have_content(fornecedor_nao_filtrado.segmento_id)
        expect(page).to_not have_content(fornecedor_nao_filtrado.regiao_id)

      end
      it 'regiao e segmento' do
        expect(page).to have_content(fornecedor.nome)
        expect(page).to have_content(fornecedor.segmento_id)
        expect(page).to have_content(fornecedor.regiao_id)
        expect(page).to have_content(fornecedor_nao_filtrado.nome)
        expect(page).to have_content(fornecedor_nao_filtrado.segmento_id)
        expect(page).to have_content(fornecedor_nao_filtrado.regiao_id)

        visit "/fornecedores?regiao_id=#{fornecedor.regiao_id}&segmento_id=#{fornecedor.segmento_id}"
        sleep(2)

        expect(page).to have_content(fornecedor.nome)
        expect(page).to have_content(fornecedor.segmento_id)
        expect(page).to have_content(fornecedor.regiao_id)
        expect(page).to_not have_content(fornecedor_nao_filtrado.nome)
        expect(page).to_not have_content(fornecedor_nao_filtrado.segmento_id)
        expect(page).to_not have_content(fornecedor_nao_filtrado.regiao_id)

      end
      it 'nome, regiao e segmento' do
        expect(page).to have_content(fornecedor.nome)
        expect(page).to have_content(fornecedor.segmento_id)
        expect(page).to have_content(fornecedor.regiao_id)
        expect(page).to have_content(fornecedor_nao_filtrado.nome)
        expect(page).to have_content(fornecedor_nao_filtrado.segmento_id)
        expect(page).to have_content(fornecedor_nao_filtrado.regiao_id)

        visit "/fornecedores?nome=#{fornecedor.nome}&regiao_id=#{fornecedor.regiao_id}&segmento_id=#{fornecedor.segmento_id}"
        sleep(2)

        expect(page).to have_content(fornecedor.nome)
        expect(page).to have_content(fornecedor.segmento_id)
        expect(page).to have_content(fornecedor.regiao_id)
        expect(page).to_not have_content(fornecedor_nao_filtrado.nome)
        expect(page).to_not have_content(fornecedor_nao_filtrado.segmento_id)
        expect(page).to_not have_content(fornecedor_nao_filtrado.regiao_id)

      end
    end
  end
end
