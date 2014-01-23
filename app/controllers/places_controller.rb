class PlacesController < ApplicationController

	before_action :find_place, only: [:show, :edit, :update, :destroy]

	def index
		# @places = Place.near("london")

		# if a user has searched for a location search near 
		# the oarameter they have searched otherwise search near london
		
		# the param they have searched for is params[:location]
		if params[:location].present?
			# search for the params near params[:location]
			@places = Place.near(params[:location])
		else
			# search for places near london
			# @places = Place.near("London")
			@places = Place.all
		end
	end


	def new
		@place= Place.new
	end

	def create
		@place = Place.new(place_params)
		if @place.save
			flash[:success] = "record has been added"
			redirect_to root_path
		else
			render "new"
		end
	end



	def destroy

		@place.destroy
		flash[:success] = "you have deleted the place"
		redirect_to root_path

	end

	def edit

	end

	def update
		if 	@place.update(place_params)
			flash[:success] = "Updated"
			redirect_to root_path
		else
			render "edit"
		end
	end

	# shortcut for finding a story from the url
#  find story is not part of rails, but is a timesaving task created by ourseleves
	def find_place
		@place = Place.find(params[:id])

	end

	def place_params
		params.require(:place).permit(:title, :post_code, :plan, :longitude, :latitude)
	end

end
