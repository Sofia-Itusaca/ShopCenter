class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :producto

  def line_item_total
    quantity * producto.price
  end
end
