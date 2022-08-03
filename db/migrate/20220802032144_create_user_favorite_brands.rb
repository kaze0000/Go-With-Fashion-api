class CreateUserFavoriteBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :user_favorite_brands do |t|
      t.references :user, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
