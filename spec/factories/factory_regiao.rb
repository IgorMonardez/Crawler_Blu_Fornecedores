# frozen_string_literal: true

FactoryBot.define do
  factory :regiao do
    nome { Faker::Address.unique.city }
  end
end
