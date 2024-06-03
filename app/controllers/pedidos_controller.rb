class PedidosController < ApplicationController
    before_action :set_pedido, only: %i[show edit update destroy]
  
    def index
      @pedidos = Pedido.all
    end
  
    def show
    end
  
    def new
      @pedido = Pedido.new
      @pedido.itens_pedidos.build
    end
  
    def edit
    end
  
    def create
      @pedido = Pedido.new(pedido_params)
  
      if @pedido.save
        redirect_to @pedido, notice: 'Pedido criado com sucesso.'
      else
        render :new
      end
    end
  
    def update
      if @pedido.update(pedido_params)
        redirect_to @pedido, notice: 'Pedido atualizado com sucesso.'
      else
        render :edit
      end
    end
  
    def destroy
      @pedido.destroy
      redirect_to pedidos_url, notice: 'Pedido excluído com sucesso.'
    end
  
    private
  
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end
  
    def pedido_params
      params.require(:pedido).permit(:data_hora, :numero_nota_fiscal, :valor_frete, :valor_desconto, :valor_total, itens_pedido_attributes: [:id, :nome, :quantidade, :preco, :_destroy])
    end
  end
  