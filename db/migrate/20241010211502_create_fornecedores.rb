class CreateFornecedores < ActiveRecord::Migration[7.2]
  def change
    create_table :fornecedores do |t|
      t.string :nome
      t.references :segmentos, foreign_key: true
      t.references :regioes, foreign_key: true


      t.timestamps
    end
  end
end
