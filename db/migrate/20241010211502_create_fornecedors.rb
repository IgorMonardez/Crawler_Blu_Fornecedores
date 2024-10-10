class CreateFornecedors < ActiveRecord::Migration[7.2]
  def change
    create_table :fornecedors do |t|
      t.string :nome
      t.references :segmentos, foreign_key: true
      t.references :regiaos, foreign_key: true


      t.timestamps
    end
  end
end
