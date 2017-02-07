class FilmsController < ApplicationController
	before_action :findFilm, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def index	
		if params[:genre].blank?
			@films = Film.all.order("created_at DESC")
		else
			@genre = Genre.find_by(name: params[:genre])
			@films = @genre.films.includes(:genres).order("created_at DESC")
		end
	end

	def new
		@film = current_user.films.build	
	end

	def show
		if @film.reviews.blank?
			@average_review = 0
		else
			@average_review = @film.reviews.average(:rating).round(2)
		end
	end

	def create
		@film = current_user.films.build(film_params)

		if @film.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @film.update(film_params)
			redirect_to film_path(@film)
		else
			render 'edit'
		end
	end

	def destroy
		@film.destroy
		redirect_to root_path
	end

	private 

		def film_params
			params.require(:film).permit(:title, :description, :director, {genre_ids: []}, :film_img)
		end

		def findFilm
			@film = Film.find(params[:id])
		end

end
