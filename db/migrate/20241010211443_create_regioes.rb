class CreateRegiaos < ActiveRecord::Migration[7.2]
  def change
    create_table :regioes do |t|
      t.string :nome

      t.timestamps
    end
  end
end
