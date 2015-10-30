class DosesController < ApplicationController
	before_action :set_cocktail, only: [:new, :create]

	def new
		@dose = Dose.new
	end

	def create
		# @dose = Dose.new(dose_params)
		# @dose.cocktail_id = @cocktail.id
		# OR
		@dose = @cocktail.doses.new(dose_params)
		# then
		if @dose.save
			redirect_to cocktail_path(@cocktail)
		else
			render :new
		end
	end

	def destroy
		@dose = Dose.find(params[:id])
		@dose.destroy
		redirect_to :back
	end

	private
	def dose_params
		params.require(:dose).permit(:description, :ingredient_id)
	end

	def set_cocktail
		@cocktail = Cocktail.find(params[:cocktail_id])
	end
end