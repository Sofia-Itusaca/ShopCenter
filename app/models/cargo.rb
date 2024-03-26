class Cargo < ApplicationRecord
    enum estado: [:creado, :pendiente, :pagado, :rechazado, :error]
  enum metodo_pago: [:desconocido, :targeta_de_credito, :targeta_de_débito, :cash]

  before_create :generate_uid

  private
    def generate_uid
      begin
        self.uid = SecureRandom.hex(5)
      end while self.class.exists?(uid: self.uid)

    end
end
