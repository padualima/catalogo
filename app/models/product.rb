# frozen_string_literal: true

class Product < ApplicationRecord
  include PgSearch
  extend FriendlyId
  validates :product_code, :product_description, :product_ean, :product_dun, presence: true
  validates :product_code, :product_description, :product_ean, :product_dun, uniqueness: true

  belongs_to :family
  belongs_to :group
  belongs_to :tax_classification
  belongs_to :line

  has_many :generics, class_name: 'Product', foreign_key: 'generic_id'
  belongs_to :generic, class_name: 'Product', optional: true

  has_one_attached :image

  friendly_id :product_description, use: :slugged

  pg_search_scope :search,
                  against: %i[product_description product_ean product_code product_dun]

  validate :image_validation

  def image_validation
    if respond_to?(:image) && image.attached?
      if image.blob.byte_size > 2_000_000
        image.purge
        errors[:base] << 'Tamanho maximo 2MB'
      elsif !image.blob.content_type.starts_with?('image/png', 'image/jpeg', 'image/jpg')
        image.purge
        errors[:base] << 'Formato invalido use PNG, JPEG, JPG'
      end
    end
  end

  scope :releases_home, -> { where(releases: true) }
  scope :releases_true, -> { where(releases: true).count }
  scope :status_true, -> { where(status: true).count }
end
