require 'spec_helper'
require 'rails_helper'

RSpec.describe Segmento, type: :model do
  context 'validations' do
    it 'é válido com atributos válidos' do
      fornecedor = build(:fornecedor)
      expect(fornecedor).to be_valid
    end
    context 'uniqueness' do
      let!(:segmento) { create(:segmento) }
      let(:segmento_duplicado) { build :segmento, nome: segmento.nome }
      it { expect(segmento_duplicado).not_to be_valid }
    end
  end
  context 'associations' do
    it { should have_many(:fornecedors) }
  end
end
