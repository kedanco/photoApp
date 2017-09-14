class Photo < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :album

end