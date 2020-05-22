class AddLineToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :line, foreign_key: true
  end
end
