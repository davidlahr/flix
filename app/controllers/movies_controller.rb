class MoviesController < ApplicationController
  before_action :set_movie, only:[:show, :edit, :update , :destroy]
  before_action :require_admin, except:[:show, :index]

  def index
    case params[:filter]
    when "upcoming"
      @movies = Movie.upcoming
    when "recent"
      @movies = Movie.recent
    else
      @movies = Movie.released
    end
    
  end

  def show
    @fans = @movie.fans
    @genres = @movie.genres
    @user = current_user
    if current_user
      @favorite = @user.favorites.find_by(movie_id: @movie.id)
    end
   
  end

  def edit
    
  end

  def update
    
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie successfully updated"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Movie successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    
    @movie.destroy
    redirect_to movies_url, method: :get, status: :see_other, alert: "Movie successfully deleted"
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :description, :total_gross, :rating, :release_date, :director, :duration, :image_file_name, genre_ids:[])
  end
  
  def set_movie
    @movie = Movie.find_by!(slug: params[:id])
  end

  

end
