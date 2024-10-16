class Regiao < ApplicationRecord
  self.table_name = "regiaos"
  has_many :fornecedors

  validates :nome, uniqueness: true
end
