class PumpPhoto < ApplicationRecord
  belongs_to :pump
  has_attached_file :photo, styles: {thumb: "400x400", medium: "250x250>"}
  validates_attachment :photo, :content_type => {:content_type => %w(image/jpeg image/jpg image/png)}
end
