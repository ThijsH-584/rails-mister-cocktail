class DosesController < ApplicationController
  def new
  	@dose = Dose.new
  	@cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
  	# raise
  	@dose = Dose.new(params[:dose].permit(:description, :cocktail_id, :ingredient_id))
  	@dose.cocktail = Cocktail.find(params[:cocktail_id])
  	if @dose.save
  	  redirect_to cocktail_path(@dose[:cocktail_id])
  	else
  		render :new
  	end
  end

  def destroy
  	@dose= Dose.find(params[:id])
  	@dose.destroy
  end
end
