class Uniques < ActiveRecord::Migration[7.2]
  def change
    add_index :regiaos, :nome, unique: true
    add_index :segmentos, :nome, unique: true
  end
end
