class FavoritesController < ApplicationController
    skip_before_action :protect_pages_admin
    before_action :protect_pages_login
    def index

    end

    def create
      producto.favorite!
      #Favorite.create(producto: producto, user: Current.user)
      respond_to do |format|
        format.html do
          redirect_to producto_path(producto)
        end
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "favorite",                          # El ID del elemento HTML que se reemplazará
            partial: "productos/favorite",       # La ruta al partial que se utilizará para renderizar el contenido
            locals: { producto: producto }       # Las variables locales que se pasan al partial
          )
        end        
      end
    end
  
    def destroy
      producto.unfavorite!
      respond_to do |format|
        format.html do
          redirect_to producto_path(producto), status: :see_other
        end
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "favorite",                          # El ID del elemento HTML que se reemplazará
            partial: "productos/favorite",       # La ruta al partial que se utilizará para renderizar el contenido
            locals: { producto: producto }       # Las variables locales que se pasan al partial
          )
        end
        
      end
    end
  
  
  
    private
  
    def producto
      @producto ||= Producto.find(params[:producto_id])
    end
  end