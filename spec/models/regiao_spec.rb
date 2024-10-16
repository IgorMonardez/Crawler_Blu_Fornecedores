require 'spec_helper'
require 'rails_helper'

RSpec.describe Regiao, type: :model do
  context 'validations' do
    it 'é válido com atributos válidos' do
      fornecedor = build(:fornecedor)
      expect(fornecedor).to be_valid
    end
    context 'uniqueness' do
      let!(:regiao) { create(:regiao) }
      let(:regiao_duplicado) { build :regiao, nome: regiao.nome }
      it { expect(regiao_duplicado).not_to be_valid }
    end
  end
  context 'associations' do
    it { should have_many(:fornecedors) }
  end
end
