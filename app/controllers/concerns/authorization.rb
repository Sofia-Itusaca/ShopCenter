module Authorization
    extend ActiveSupport::Concern
    included do 
        private
        def authorize!
            if Current.user.admin?
                # Si el usuario es administrador, no se hace nada
              else
                redirect_to productos_path, alert: "Necesitas permisos de administrador para esta acción"
              end       
         end
    end
end