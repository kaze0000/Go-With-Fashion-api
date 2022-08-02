class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :body
      t.datetime :prefferd_at
      t.integer :prefferd_prefecture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end