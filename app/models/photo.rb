class Photo < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :album
  has_many :comments, dependent: :destroy

  validates :image,presence: true

end
