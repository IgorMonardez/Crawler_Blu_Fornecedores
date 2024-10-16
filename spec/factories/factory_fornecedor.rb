# frozen_string_literal: true

FactoryBot.define do
  factory :fornecedor do
    nome { Faker::Company.unique.name }
    association :segmento, factory: :segmento
    association :regiao, factory: :regiao
  end
end
