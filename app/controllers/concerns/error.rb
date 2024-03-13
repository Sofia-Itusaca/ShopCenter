module Error
    extend ActiveSupport::Concern
  
    included do
      rescue_from ActiveRecord::RecordNotFound do
        redirect_to productos_path, alert: "Usuario no encontrado" 
      end
    end
  
  end