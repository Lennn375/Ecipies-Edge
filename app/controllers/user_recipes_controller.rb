class UserRecipesController < ApplicationController
  def index
    @user_recipe = Recipe.new
  end

  def show
    @user_recipe = UserRecipe.find(params[:id])
    # @user_recipe_collection = UserRecipeCollection.new
    # raise
    # Find UserRecipeCollection where this recipe is stored.
    # Find all collections of the current user
    # Pass this collections in the array if they are not equal to the collections find in step 1.
    # Pass these @collections to the modal
  end

  def create
    @user_recipe = UserRecipe.new(user_recipe_params)
    @user_recipe.user = current_user
    @user_recipe.recipe = Recipe.find(params[:recipe_id])
    # raise

    if @user_recipe.save
      # if params[:user_recipe][:collection_ids].present?
      # end
      params[:user_recipe][:collection_ids].each do |id|
        UserRecipeCollection.create!(user_recipe: @user_recipe, collection: Collection.find(id))
      end
      all_default_collection = Collection.where(user: current_user, name: "All")[0]
      UserRecipeCollection.create!(user_recipe: @user_recipe, collection: all_default_collection)
      # user_recipe_collection = UserRecipeCollection.new(
      #   collection_id: params[:user_recipe][:collection_ids],
      #   user_recipe_id: @user_recipe.id)
      # user_recipe_collection.save
      redirect_to recipe_path(params[:recipe_id]), notice: 'Recipe was added to your cookbook.'

    # default_collection_id = Collection.where(name: 'All', user: current_user)[0].id
    else
      redirect_to recipe_path(params[:recipe_id]), notice: 'This recipe is already in your cookbook.'
    end
  end

  def destroy
    @user_recipe = UserRecipe.find(params[:id])
    @user_recipe.destroy
    redirect_to
  end

  def edit
    @user_recipe = UserRecipe.find(params[:id])
  end

  def update
    @user_recipe = UserRecipe.update(user_recipe_params)
    redirect_to root_path
  end

  private

  def user_recipe_params
    params.require(:user_recipe).permit(:user_id, :recipe_id)
  end
end
