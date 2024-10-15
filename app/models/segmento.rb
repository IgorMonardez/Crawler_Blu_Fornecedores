class Segmento < ApplicationRecord
  has_many :fornecedors

  validates :nome, uniqueness: true
end
