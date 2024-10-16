# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Regioes', type: :feature, js: true do
  let!(:regioes) { create_list :regiao, 5 }

  before do
    visit regioes_path
  end

  context 'Mostra as regioes' do
    it do
      regioes.each do |regiao|
        expect(page).to have_content(regiao.nome)
      end
    end
  end
end
