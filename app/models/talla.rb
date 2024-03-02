class Talla < ApplicationRecord
    validates :name, presence: true
    has_many :productos, dependent: :restrict_with_exception
end
