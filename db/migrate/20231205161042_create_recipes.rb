class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :instructions
      t.integer :servings
      t.string :cooking_time

      t.timestamps
    end
  end
end
