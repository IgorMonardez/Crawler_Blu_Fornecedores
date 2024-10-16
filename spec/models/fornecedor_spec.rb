require 'spec_helper'
require 'rails_helper'

RSpec.describe Fornecedor, type: :model do
  context 'validations' do
    it 'é válido com atributos válidos' do
      fornecedor = build(:fornecedor)
      expect(fornecedor).to be_valid
    end
    context 'uniqueness' do
      let!(:fornecedor) { create(:fornecedor) }
      let(:fornecedor_duplicado) { build :fornecedor, nome: fornecedor.nome }
      it { expect(fornecedor_duplicado).not_to be_valid }
    end
  end
  context 'associations' do
    it { should belong_to(:regiao) }
    it { should belong_to(:segmento) }
  end
end
