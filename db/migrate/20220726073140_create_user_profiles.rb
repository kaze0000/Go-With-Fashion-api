class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :name, null: false
      t.integer :gender
      t.string :self_introducement
      t.string :twitter
      t.string :instagram
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
