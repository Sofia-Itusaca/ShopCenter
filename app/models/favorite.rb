class Favorite < ApplicationRecord
  validates :user, uniqueness: {scope: :producto} 

  belongs_to :user
  belongs_to :producto
end
