# frozen_string_literal: true

FactoryBot.define do
  factory :segmento do
    segmentos = ['Bicicleta', 'Calçados', "Colchões", "Drogarias","Eletroeletrônico","Eventos, Bebidas e Alimentos",
    "Loja de Artigos em Geral", "Matéria Prima", "Móveis", "Ótica", "Peças / Serviços Automotivos", "Vestuário"]

    nome { segmentos.sample }
  end
end
