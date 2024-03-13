class Authentication::SessionsController<ApplicationController
  skip_before_action :protect_pages_admin

  def new
  end

  def create
    #buscamos por email o por userame
    @user = User.find_by("email = :login OR username = :login",{login: params[:login]})

    if @user&.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to productos_path, notice: "BIENVENIDO"
    else
        redirect_to new_session_path, alert: "user/password incorrectos"
    end
  end

  def destroy
    # Encuentra todos los elementos del carrito asociados al usuario actual
    carritos = Carrito.where(user: Current.user)

    # Elimina todos los elementos del carrito asociados al usuario actual
    carritos.destroy_all if carritos.any?
    session.delete(:user_id)
    redirect_to productos_path, notice: "Has cerrado sesión correctamente."
  end
end