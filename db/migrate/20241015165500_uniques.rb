class Uniques < ActiveRecord::Migration[7.2]
  def change
    rename_table :regiaos, :regioes
    rename_table :fornecedors, :fornecedores

    add_index :regioes, :nome, unique: true
    add_index :segmentos, :nome, unique: true
    add_index :fornecedores, :nome, unique: true
  end
end
