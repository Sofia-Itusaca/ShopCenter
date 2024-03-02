class Producto < ApplicationRecord
  #un archivo adjunto foto
  has_one_attached :photo

  validates :titulo, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :color, presence: true
  validates :stock, presence: true


  #decimos que el modelo product pertenece a categorias
  belongs_to :category

  belongs_to :talla
end
