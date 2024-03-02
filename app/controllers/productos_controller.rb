class ProductosController < ApplicationController
  before_action :producto, only: [:show, :edit, :update, :destroy]

  def index
    @productos = Producto.all
  end

  def new
    @producto = Producto.new
    @tallas = Talla.all.order(name: :asc)
  end

  def create
    @producto = Producto.new(producto_params)

    if @producto.save
      redirect_to productos_path, notice: "El producto ha sido creado correctamente"
    else
      render :new, status: :unprocessable_entity, alert: "El producto no ha sido creado correctamente"
    end
  end

  def show
    producto
  end

  def edit
    @producto = Producto.find(params[:id])
  end

  def update
    if @producto.update(producto_params)
      redirect_to producto_path(@producto), notice: "El producto ha sido actualizado correctamente"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @producto.destroy
    redirect_to productos_path, notice: t('.destroyed'), status: :see_other
  end



  private

  def producto_params
    params.require(:producto).permit(:titulo, :description, :price, :color, :stock, :category_id, :talla_id, :photo)
  end
  
  
  def producto
    @producto =  Producto.find(params[:id])
    #return @product
  end
end
