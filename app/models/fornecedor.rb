class Fornecedor < ApplicationRecord
  self.table_name = "fornecedores"
  self.primary_key = "id"
  has_one :regiao
  has_one :segmento

  validates :nome, uniqueness: true
end
