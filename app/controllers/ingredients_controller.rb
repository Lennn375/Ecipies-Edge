class IngredientsController < ApplicationController

  def index
    if params[:query].present?
      @ingredients = Ingredient.search_ingredient_in_db(params[:query])
    else
      @ingredients = Ingredient.all
    end
    @user_ingredient_ids = UserIngredient.where(user: current_user).pluck(:ingredient_id)
    # ingredients = Ingredient.find(@user_ingredient_ids)

    # category_ids = ingredients.pluck(:category_id)
    # @categories = Category.where.not(id: category_ids)
    @categories = Category.all
  end

end

# if params[:query].present?
#   @ingredients = Ingredient.search_ingredient_in_db(params[:query])
#   raise
#   category_ids = @ingredients.pluck(:category_id)
#   @categories = Category.find(category_ids)
#   # @categories should take Category that are included in ingredient category_id only.
# else
#   @ingredients = Ingredient.all

#   @user_ingredient_ids = UserIngredient.where(user: current_user).pluck(:ingredient_id)
#   ingredients = Ingredient.find(@user_ingredient_ids)
#   category_ids = ingredients.pluck(:category_id)
#   @categories = Category.where.not(id: category_ids)
