class UsersController < ApplicationController
    skip_before_action :protect_pages_admin, only: :show
  
    def show
      @user = User.find_by!(username: params[:username])
      @pagy, @productos = pagy_countless(FindProductos.new.call(producto_prams_index), items: 12)

    end
end
  