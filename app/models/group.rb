class Group < ApplicationRecord
  validates :group_code, :group_description, presence: true
  validates :group_code, :group_description, uniqueness: true

  has_many :families, dependent: :destroy
end
