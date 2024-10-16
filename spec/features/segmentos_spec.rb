# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Segmentos' do
  let!(:segmentos) { create_list :segmento, 5 }

  before do
    visit segmentos_path
  end

  context 'Mostra os segmentos' do
    it do
      segmentos.each do |segmento|
        expect(page).to have_content(segmento.nome)
      end
    end
  end
end
