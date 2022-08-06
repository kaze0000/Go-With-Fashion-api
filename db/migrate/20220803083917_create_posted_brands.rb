class CreatePostedBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :posted_brands do |t|
      t.references :brand, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
