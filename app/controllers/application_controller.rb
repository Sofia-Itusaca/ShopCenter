class ApplicationController < ActionController::Base
    include Pagy::Backend

    #buscar que usuario hace la peticion
    before_action :set_current_user
    #hacemos un callback para proteger nuesttras paginas
    before_action :protect_pages



    def set_current_user
        #find_by no arroja error si no encuentra el usuario
        #esta accion se realizara solo si la session exiten
        Current.user = session[:user_id] ? User.find_by(id: session[:user_id]) : nil
    end

    def protect_pages
        redirect_to new_session_path, alert: "sesiòn como administrador no iniciada" unless Current.user
    end

end
