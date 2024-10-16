class Fornecedor < ApplicationRecord
  self.table_name = "fornecedores"
  self.primary_key = "id"
  belongs_to :regiao
  belongs_to :segmento

  validates :nome, uniqueness: true
end
