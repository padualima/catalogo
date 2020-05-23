class Line < ApplicationRecord
  has_many :products, dependent: :destroy
end
