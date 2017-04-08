class PumpsCategory < ApplicationRecord
  belongs_to :type_material
  has_many :pomps, dependent: :destroy
  has_attached_file :photo, styles: {thumb: "400x400", medium: "250x250>"}
  validates_attachment :photo, :content_type => {:content_type => %w(image/jpeg image/jpg image/png)}
end
