class Pedido < ApplicationRecord
    has_many :itens_pedidos, dependent: :destroy
    accepts_nested_attributes_for :itens_pedidos, allow_destroy: true
  end
  