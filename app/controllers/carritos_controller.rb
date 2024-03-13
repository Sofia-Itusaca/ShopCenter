class CarritosController < ApplicationController
    skip_before_action :protect_pages_admin
    before_action :protect_pages_login    

    def index

    end
    
    def create
        Carrito.create(producto: producto, user: Current.user)
        redirect_to productos_path, notice: "Producto añadido al carrito"
    end


    private

    def producto
        @producto ||= Producto.find(params[:producto_id])
    end
end