class Product < ApplicationRecord
  validates :product_code, :product_description, :product_ean, :product_dun, presence: true
  validates :product_code, :product_description, :product_ean, :product_dun, uniqueness: true

  belongs_to :family
  belongs_to :group
  belongs_to :tax_classification

  has_many :generics, class_name: 'Product', foreign_key: 'generic_id'
  belongs_to :generic, class_name: 'Product', optional: true

  has_one_attached :image

  validate :image_validation

  def image_validation
    if respond_to?(:image) && image.attached?
      if image.blob.byte_size > 2000000
        image.purge
        errors[:base] << 'Tamanho maximo 2MB'
      elsif !image.blob.content_type.starts_with?('image/png', 'image/jpeg', 'image/jpg')
        image.purge
        errors[:base] << 'Formato invalido use PNG, JPEG, JPG'
      end
    end
  end

  scope :releases_home, -> {where(releases: true)}
  scope :releases_true, -> {where(releases: true)}
  scope :status_true, -> {where(status: true)}
end
