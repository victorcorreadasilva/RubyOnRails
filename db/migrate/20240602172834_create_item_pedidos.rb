class CreateItemPedidos < ActiveRecord::Migration[6.1]
  def change
    create_table :itens_pedidos do |t|
      t.references :pedido, null: false, foreign_key: true
      t.string :nome
      t.integer :quantidade
      t.decimal :preco

      t.timestamps
    end
  end
end
