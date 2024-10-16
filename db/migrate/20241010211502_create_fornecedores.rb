class CreateFornecedores < ActiveRecord::Migration[7.2]
  def change
    create_table :fornecedores do |t|
      t.string :nome
      t.references :segmento, foreign_key: true
      t.references :regiao, foreign_key: true


      t.timestamps
    end
  end
end
