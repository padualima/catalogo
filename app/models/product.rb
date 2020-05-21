class Product < ApplicationRecord
  belongs_to :tax_classification
  belongs_to :group
  belongs_to :family
end
