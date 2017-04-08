class Pump < ApplicationRecord
  belongs_to :pumps_category
  has_many :pump_photo, dependent: :destroy
end
