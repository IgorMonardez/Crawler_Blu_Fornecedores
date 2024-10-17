# frozen_string_literal: true

FactoryBot.define do
  factory :segmento do
    nome { Faker::Commerce.unique.department(max: 1) }
  end
end
