class Authentication::UsersController<ApplicationController
  skip_before_action :protect_pages
  before_action :require_admin, only: [:edit, :update, :destroy]
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to productos_path, notice: "successfully registered user"
    else
      render :new, status: :unprocessable_entity
    end
  end
    
  private
    
  def user_params
    params.require(:user).permit(:email, :username, :password, :admin)
  end

  def require_admin
    unless current_user && current_user.admin?
      redirect_to productos_path, alert: "Acceso no autorizado."
    end
  end
end   