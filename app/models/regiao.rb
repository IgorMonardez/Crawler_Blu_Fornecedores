class Regiao < ApplicationRecord
  self.table_name = "regioes"
  has_many :fornecedors

  validates :nome, uniqueness: true
end
