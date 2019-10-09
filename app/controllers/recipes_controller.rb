class RecipesController < ApplicationController
  def index
    @recipes = FoodService.get_recipes(params[:search])
  end

  def show
    @recipe = FoodService.get_ingredients(params[:id])
    
    if @recipe.nil?
      redirect_to root_path, notice: "There is no intructions available for this dish"
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:search)
  end
end