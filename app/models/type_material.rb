class TypeMaterial < ApplicationRecord
  has_many :pumps_categories, dependent: :destroy
  validates :name, uniqueness: true
  validates :code, uniqueness: true
end
