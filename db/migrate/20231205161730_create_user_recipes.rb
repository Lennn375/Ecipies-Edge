class CreateUserRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :user_recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
