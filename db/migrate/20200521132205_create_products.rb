class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :product_code
      t.string :product_description
      t.integer :product_ean
      t.integer :product_dun
      t.references :tax_classification, foreign_key: true
      t.references :group, foreign_key: true
      t.references :family, foreign_key: true
      t.boolean :status
      t.boolean :releases
      t.integer :generic_id
      t.integer :display_ean

      t.timestamps
    end
  end
end
