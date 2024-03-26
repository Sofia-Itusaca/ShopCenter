class CargosController < ApplicationController
    before_action :protect_pages_login
    def index
      authorize!
      @cargos = Cargo.all
    end
  
    def new
      @cargo = Cargo.new
    end
  
    def create
      cargo = Cargo.new(cargo_params)
      if cargo.save
        # Encuentra todos los elementos del carrito asociados al usuario actual
        carritos = Carrito.where(user: Current.user)
  
        # Elimina todos los elementos del carrito asociados al usuario actual
        carritos.destroy_all if carritos.any?
        redirect_to productos_path, notice: "Confirmacion de pago pendiente"
      else
        render :new, status: :unprocessable_entity, alert: "Fallo en el proceso de pago"
      end
    end
  
    private
  
    def cargo_params
      params.require(:cargo).permit(:monto)
    end
  end
  