class Uniques < ActiveRecord::Migration[7.2]
  def change
    add_index :regioes, :nome, unique: true
    add_index :segmentos, :nome, unique: true
    add_index :fornecedores, :nome, unique: true
  end
end
