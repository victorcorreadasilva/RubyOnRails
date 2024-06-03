class CreatePedidos < ActiveRecord::Migration[6.1]
  def change
    create_table :pedidos do |t|
      t.datetime :data_hora
      t.string :numero_nota_fiscal
      t.decimal :valor_frete
      t.decimal :valor_desconto
      t.decimal :valor_total

      t.timestamps
    end
  end
end
