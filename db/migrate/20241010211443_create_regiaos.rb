class CreateRegiaos < ActiveRecord::Migration[7.2]
  def change
    create_table :regiaos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
