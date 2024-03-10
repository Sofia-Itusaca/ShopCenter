module Authentication
    extend ActiveSupport::Concern
    included do 
        #buscar que usuario hace la peticion
        before_action :set_current_user
        #hacemos un callback para proteger nuesttras paginas
        before_action :protect_pages_admin

        private

        def set_current_user
            #find_by no arroja error si no encuentra el usuario
            #esta accion se realizara solo si la session exiten
            Current.user = session[:user_id] ? User.find_by(id: session[:user_id]) : nil
        end

        def protect_pages_admin
            redirect_to new_session_path, alert: "sesiòn como administrador no iniciada" unless Current.user
        end

        def protect_pages_login
            redirect_to new_session_path, alert: "Necesita loguearse para realizar esta acciòn" unless Current.user
        end

    end
end