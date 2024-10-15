class ChangeFk < ActiveRecord::Migration[7.2]
  def change

    remove_column :regioes, :segmentos_id
    rename_column :fornecedores, :regiaos_id, :regioes_id
  end
end
