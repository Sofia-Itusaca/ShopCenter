class Carrito < ApplicationRecord
  validates :user_id, uniqueness: { scope: :producto_id }
  belongs_to :user
  belongs_to :producto
end

