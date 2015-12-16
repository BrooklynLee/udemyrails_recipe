class IngredientsController < ApplicationController

   before_action :require_user, except: [:show]
   
  def new
    @ingredient = Ingredient.new
  end
  
  def create
    @ingredient = Ingredient.new(ingredients_params)
    if @ingredient.save
       flash[:success] = "The #{@ingredient.name} was successfuly created"
       redirect_to recipes_path
    else
      render :new
    end
  end
  
  def show
   @ingredient = Ingredient.find(params[:id])
   @recipes = @ingredient.recipes.paginate(page: params[:page], per_page: 4)
  end
  
 
  
private

  def ingredients_params
    params.require(:ingredient).permit(:name)
  end
end