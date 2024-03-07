class User < ApplicationRecord
  #metodos para gusardar las contraseñas encriptadas y el tema del login
  has_secure_password

  validates  :email, presence: true, uniqueness: true,
    format:{
      with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
      message: :invalid
    }
  validates  :username, presence: true, uniqueness: true,
    length: { in: 3..15 },
    format:{
      with: /\A[a-z-0-9-A-Z]+\z/,
      message: :invalid
    }
  validates :password, length: { minimum: 6 }

  #antes de guardar se llama a ese metodo
  before_save :downcase_attributes
  
  def admin?
    admin
  end
  
  private
  #meotod para poner todos los caracteres en minusculas
  def downcase_attributes
    self.username = username.downcase
    self.email = email.downcase
  end

  
end
