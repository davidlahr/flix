class FavoritesController < ApplicationController
  before_action :require_signin, only:[:create]
  
  def create
    @movie = Movie.find_by!(slug: params[:movie_id])
    @movie.favorites.create!(user: current_user)
    redirect_to @movie
  end

  def destroy
    favorite = current_user.favorites.find(params[:id])
    favorite.destroy

    movie = Movie.find_by(slug: params[:movie_id])
    redirect_to movie
  end
end
